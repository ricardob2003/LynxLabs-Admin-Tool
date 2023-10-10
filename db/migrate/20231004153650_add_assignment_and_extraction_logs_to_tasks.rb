class AddAssignmentAndExtractionLogsToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :assignment_log, :text
    add_column :tasks, :extraction_log, :text
  end
end
