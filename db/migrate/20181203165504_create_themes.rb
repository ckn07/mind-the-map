class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :name
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
