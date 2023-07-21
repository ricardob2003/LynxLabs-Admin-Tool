class RemoveCityIdFromEmpleados < ActiveRecord::Migration[7.0]
  def change
    remove_column :empleados, :city_id, :integer
  end
end
