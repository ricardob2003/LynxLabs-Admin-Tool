class HomeController < ApplicationController
  def index
    @actions = {
      "Agregar al Inventario" => new_inventory_path,
      "Crear Perfil de Empleado" => new_employee_path,
      "Asignar Equipo" => asignar_equipo_path,
      "Extracción de Equipo" => extraccion_path,
      "Asignar Admin" => asignar_admin_path,
      "Agregar Proyecto" => new_project_path,
    }
  end
end
