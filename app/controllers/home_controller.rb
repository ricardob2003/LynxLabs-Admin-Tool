class HomeController < ApplicationController
  def index
    @actions = {
      "Agregar Proyecto" => new_project_path,
      "Crear Perfil de Empleado" => new_employee_path,
      "Agregar al Inventario" => new_inventory_path,
      "Asignar Admin" => sign_up_path,

    }
  end
end
