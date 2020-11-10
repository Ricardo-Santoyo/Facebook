class Post < ApplicationRecord
  validates :body, presence: true, unless: -> {photo.attached?}
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :photo
end
