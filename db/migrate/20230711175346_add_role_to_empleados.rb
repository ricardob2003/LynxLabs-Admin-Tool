class AddRoleToEmpleados < ActiveRecord::Migration[7.0]
  def change
    add_column :empleados, :developer, :string
  end
end
