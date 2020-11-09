class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :sent_friend_requests, foreign_key: :sender_id, class_name: 'Friendrequest'
  has_many :received_friend_requests, foreign_key: :receiver_id, class_name: 'Friendrequest'
  has_many :friendships, foreign_key: :person_id, class_name: 'Friendship'
  has_many :friends, through: :friendships
  has_one_attached :photo
end
