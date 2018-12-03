class CreatePois < ActiveRecord::Migration[5.2]
  def change
    create_table :pois do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :photo
      t.text :description
      t.string :scrapping_uri

      t.timestamps
    end
  end
end
