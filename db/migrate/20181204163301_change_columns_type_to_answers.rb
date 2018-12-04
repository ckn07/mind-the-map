class ChangeColumnsTypeToAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_column :answers, :time_to_respond
    add_column :answers, :time_to_respond, :integer
  end
end
