class Review < ApplicationRecord
  belongs_to :plane
  validates :content, length: { minimum: 20 }
end
