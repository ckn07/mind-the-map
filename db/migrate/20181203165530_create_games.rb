class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :theme, foreign_key: true
      t.integer :user_one_id
      t.integer :user_two_id
      t.integer :score_one
      t.integer :score_two
      t.time :total_time_one
      t.time :total_time_two
      t.timestamps
    end
  end
end
