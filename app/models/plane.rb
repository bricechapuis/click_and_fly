class Plane < ApplicationRecord
  belongs_to :user
  validates :title, :description, :capacity, :autonomy, :price, :registration_number, :airfield, :pilot, :model, presence: true, allow_blank: false
end
