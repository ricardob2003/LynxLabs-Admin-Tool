class AddAssignedToToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :assigned_to, foreign_key: { to_table: :employees }
  end
end
