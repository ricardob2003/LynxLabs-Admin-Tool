class RemoveColumnsFromEmpleados < ActiveRecord::Migration[7.0]
  def change
    remove_column :empleados, :country_code, :string
    remove_column :empleados, :region, :string
    remove_column :empleados, :city, :string
    remove_column :empleados, :address, :string
  end
end
