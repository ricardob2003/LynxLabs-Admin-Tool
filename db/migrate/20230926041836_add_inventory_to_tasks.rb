class AddInventoryToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :inventory, null: false, foreign_key: true
  end
end
