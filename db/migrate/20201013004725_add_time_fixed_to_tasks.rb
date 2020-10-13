class AddTimeFixedToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :time_fixed, :boolean, null: false, default: false
  end
end
