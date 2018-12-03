class AddfieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string,  null: false
    add_column :users, :first_name, :string,  null: false
    add_column :users, :last_name, :string,  null: false
    add_column :users, :address, :string,  null: false
    add_column :users, :photo, :string,  null: false
  end
end
