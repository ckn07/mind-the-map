class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true
      t.references :poi, foreign_key: true
      t.time :time_to_respond
      t.float :latitude
      t.float :longitude
      t.integer :score

      t.timestamps
    end
  end
end
