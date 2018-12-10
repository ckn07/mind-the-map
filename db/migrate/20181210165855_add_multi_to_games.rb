class AddMultiToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :multi, :boolean
  end
end
