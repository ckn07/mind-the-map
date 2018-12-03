class Theme < ApplicationRecord
  belongs_to :city
  has_many :theme_pois
  has_many :games
  validates :name, presence: true
  # a deccommente quand on aura sette carrier / cloudinary
  # validates :photo, presence: true
  # mount_uploader :photo, PhotoUploader
end
