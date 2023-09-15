class RemoveAssignedToIdFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :assigned_to_id
  end
end
