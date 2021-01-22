require "open-uri"
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :sent_friend_requests, foreign_key: :sender_id, class_name: 'Friendrequest', dependent: :destroy
  has_many :received_friend_requests, foreign_key: :receiver_id, class_name: 'Friendrequest', dependent: :destroy
  has_many :friendships, foreign_key: :person_id, class_name: 'Friendship', dependent: :destroy
  has_many :persons, foreign_key: :friend_id, class_name:'Friendship', dependent: :destroy
  has_many :friends, through: :friendships
  has_one_attached :photo

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      avatar = open("https://graph.facebook.com/#{auth.uid}/picture?type=large&access_token=#{ENV['facebook_app_id']}|#{ENV['facebook_app_secret']}")
      user.photo.attach(io: avatar, filename: "user_icon.jpg")
    end
  end

  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.with(user: self).welcome_email.deliver_now
  end
end
