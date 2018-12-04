class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :answers
  has_many :games
  validates :username, presence: true, uniqueness: true
  validates :photo, presence: true

  # a discute ensemble avant de decommente.. veux t on rendre ces champs obligatoires
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :photo, presence: true
  # validates :address, presence: true

  mount_uploader :photo, PhotoUploader

  # a decommente quand on aura installe le geocoder
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
