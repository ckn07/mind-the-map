class ChangeUsersIdsRefToGames < ActiveRecord::Migration[5.2]
  def change
    # remove_column :games, :user_one
    # remove_column :games, :user_one
    # add_column :games, :user_one_id, :integer
    # add_column :games, :user_two_id, :integer
    add_foreign_key :games, :users, column: :user_one_id
    add_foreign_key :games, :users, column: :user_two_id
  end
end
