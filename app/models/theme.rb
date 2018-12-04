class Theme < ApplicationRecord
  belongs_to :city
  has_many :theme_pois
  has_many :games
  validates :name, presence: true
  mount_uploader :photo, PhotoUploader
end
