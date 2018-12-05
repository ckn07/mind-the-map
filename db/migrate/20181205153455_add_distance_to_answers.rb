class AddDistanceToAnswers < ActiveRecord::Migration[5.2]
  def change
        add_column :answers, :distance, :integer
  end
end
