class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :theme, foreign_key: true
      t.string :user_one
      t.string :user_two
      t.integer :score_one
      t.integer :score_two
      t.time :total_time_one
      t.time :total_time_two
      t.timestamps
    end
  end
end
