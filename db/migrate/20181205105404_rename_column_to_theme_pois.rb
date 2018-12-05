class RenameColumnToThemePois < ActiveRecord::Migration[5.2]
  def change
    rename_column :theme_pois, :pois_id, :poi_id
  end
end
