class Theme < ApplicationRecord
  belongs_to :city
  has_many :theme_pois
  has_many :pois, through: :theme_pois
  has_many :games, dependent: :destroy
  validates :name, presence: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
end

# has_many :pois, through: :theme_pois
