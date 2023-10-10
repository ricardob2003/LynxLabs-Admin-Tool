class RemoveEquipmentLogFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :equipment_log, :text
  end
end
