class CreateThemePois < ActiveRecord::Migration[5.2]
  def change
    create_table :theme_pois do |t|
      t.references :theme, foreign_key: true
      t.references :pois, foreign_key: true

      t.timestamps
    end
  end
end
