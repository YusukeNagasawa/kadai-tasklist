class Task2 < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :status, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }
end