class UpdateAnswersTimetorespondToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :answers, :time_to_respond, :float
  end
end
