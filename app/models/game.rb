class Game < ApplicationRecord
  belongs_to :theme
  belongs_to :user_one, class_name: 'User'
  belongs_to :user_two, class_name: 'User', optional: true
  has_many :answers, dependent: :destroy

  def winner
    if score_two && score_two > score_one
      user_two
    else
      user_one
    end
  end
end
