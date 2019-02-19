class Plane < ApplicationRecord
  belongs_to :user
  validates :pilot, default: false
  validates :title, :description, :capacity, :autonomy, :price, :registration_number, :airfield, :model, presence: true, allow_blank: false

  mount_uploader :photo, PhotoUploader
end
