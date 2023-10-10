class ChangeAssignmentAndExtractionLogsDataTypes < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :assignment_log, :string
    change_column :tasks, :extraction_log, :string
  end
end
