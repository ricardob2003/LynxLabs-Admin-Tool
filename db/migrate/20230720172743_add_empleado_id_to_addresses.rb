class AddEmpleadoIdToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :empleado, null: false, foreign_key: true
  end
end
