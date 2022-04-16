class ChangeTasksDeadline < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks,:deadline,:string
    add_column :tasks, :deadline, :date
  end
end
