class AddClearToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks,:clear,:integer
  end
end
