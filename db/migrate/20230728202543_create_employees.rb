class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :nombre
      t.string :apellido
      t.string :nacionalidad
      t.string :estado_civil
      t.string :dni
      t.string :rtn
      t.string :contrato
      t.string :developer

      t.timestamps
    end
  end
end
