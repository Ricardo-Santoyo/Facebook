class Friendship < ApplicationRecord
  validates :person_id, :friend_id, presence: true
  belongs_to :person, foreign_key: :person_id, class_name: 'User'
  belongs_to :friend, foreign_key: :friend_id, class_name: 'User'
end
