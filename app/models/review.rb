class Review < ApplicationRecord
  belongs_to :plane
  belongs_to :user
  validates :content, length: { minimum: 20 }
end
