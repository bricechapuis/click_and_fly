class Plane < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  geocoded_by :airfield
  after_validation :geocode, if: :will_save_change_to_airfield?
  validates :pilot, default: false
  validates :title, :description, :capacity, :autonomy, :price, :registration_number, :airfield, :model, presence: true, allow_blank: false

  mount_uploader :photo, PhotoUploader
end
