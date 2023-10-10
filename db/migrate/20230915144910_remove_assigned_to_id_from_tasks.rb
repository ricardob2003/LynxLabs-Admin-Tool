class RemoveAssignedToIdFromTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :assigned_to_id, :integer
  end
end
