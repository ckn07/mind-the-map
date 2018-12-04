class Poi < ApplicationRecord
  has_many :anwsers
  has_many :theme_pois
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # a deccommente quand on aura sette carrier / cloudinary
  # validates :photo, presence: true
  # mount_uploader :photo, PhotoUploader


end
