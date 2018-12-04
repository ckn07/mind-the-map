class City < ApplicationRecord
  has_many :themes
  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
end
