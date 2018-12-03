class City < ApplicationRecord
  has_many :themes
  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true
  # a deccommente quand on aura sette carrier / cloudinary
  # mount_uploader :photo, PhotoUploader
end
