class HomeController < ApplicationController
  def index
    @actions = {
      "Agregar al Inventario" => home_inventario_path,
      "Crear Perfil de Empleado" => new_empleado_path,
      "Asignar Equipo" => asignar_equipo_path,
      "Extracción de Equipo" => extraccion_path,
      "Asignar Admin" => asignar_admin_path,
      "Agregar Proyecto" => new_proyecto_path,
    }
  end
end
