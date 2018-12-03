class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :answers
  has_many :games, dependent: :destroy
  validates :username, presence: true, uniqueness: true

  # a discute ensemble avant de decommente.. veux t on rendre ces champs obligatoires
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :photo, presence: true
  # validates :address, presence: true


  # a deccommente quand on aura sette carrier / cloudinary
  # mount_uploader :photo, PhotoUploader

  # a decommente quand on aura installe le geocoder
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
