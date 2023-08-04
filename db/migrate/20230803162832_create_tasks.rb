class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.date :date_of_assignment
      t.date :date_of_extraction
      t.text :equipment_log
      t.string :assigned_by

      t.timestamps
    end
  end
end
