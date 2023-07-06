class CreateProyectos < ActiveRecord::Migration[7.0]
  def change
    create_table :proyectos do |t|
      t.date :start_date
      t.date :end_date
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
