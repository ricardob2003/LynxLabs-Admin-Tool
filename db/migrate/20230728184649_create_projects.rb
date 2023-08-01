class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :cliente
      t.date :start_date
      t.date :end_date
      t.string :status
      t.string :bitacora_del_proyecto

      t.timestamps
    end
  end
end
