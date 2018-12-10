class AddTotalDistanceToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :distance_one, :integer
    add_column :games, :distance_two, :integer
  end
end

