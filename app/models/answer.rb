class Answer < ApplicationRecord
  belongs_to :game
  belongs_to :user
  belongs_to :poi
end
