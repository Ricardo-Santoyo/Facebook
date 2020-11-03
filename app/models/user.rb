class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :email, :password, presence: true
  has_many :posts, dependent: :destroy
  has_many :sent_friend_requests, foreign_key: :sender_id, class_name: 'Friendrequest'
  has_many :received_friend_requests, foreign_key: :receiver_id, class_name: 'Friendrequest'
end
