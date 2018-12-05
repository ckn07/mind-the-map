class Poi < ApplicationRecord
  has_many :anwsers
  has_many :theme_pois
  has_many :themes, through: :theme_pois
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :photo, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader
end
