class AddPhotoToTheme < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :photo, :string,  null: false
  end
end
