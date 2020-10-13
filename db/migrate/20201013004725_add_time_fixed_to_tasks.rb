class AddTimeFixedToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :time_fixed, :boolean
  end
end
