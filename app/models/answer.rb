class Answer < ApplicationRecord
  belongs_to :game
  belongs_to :user
  belongs_to :poi

  validates :time_to_respond, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :score, presence: true
end
