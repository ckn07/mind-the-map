class ChangeColumnsTypeToGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :total_time_one
    remove_column :games, :total_time_two
    add_column :games, :total_time_one, :integer
    add_column :games, :total_time_two, :integer
  end
end
