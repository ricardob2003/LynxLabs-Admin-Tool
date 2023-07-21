class AddAddressToEmpleado < ActiveRecord::Migration[7.0]
  def change
    add_reference :empleados, :address, foreign_key: true, null: true
  end
end
