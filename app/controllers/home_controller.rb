class HomeController < ApplicationController
  def index
    @actions = {
      "Agregar al Inventario" => home_inventario_path,
      "Crear Perfil de Empleado" => home_path,
      "Asignar Equipo" => home_path,
      "Extracción de Equipo" => home_path,
      "Asignar Admin" => home_path,
      "Agregar Proyecto" => home_path,
    }
  end
end
