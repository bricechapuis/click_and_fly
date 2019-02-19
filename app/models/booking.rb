class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :plane
  validates :status, inclusion: { in: ['confirmed', 'pending', 'declined'] }
end
