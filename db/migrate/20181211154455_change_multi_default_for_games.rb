class ChangeMultiDefaultForGames < ActiveRecord::Migration[5.2]
  def change
    change_column_default :games, :multi, from: nil, to: false
  end
end
