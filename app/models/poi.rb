class Poi < ApplicationRecord
  has_many :anwsers
  has_many :theme_pois
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :photo, presence: true

  geocoded_by :address
  mount_uploader :photo, PhotoUploader
end
