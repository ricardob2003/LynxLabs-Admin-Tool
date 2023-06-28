class HomeController < ApplicationController
  def index
    @actions = ["Agregar al Inventario", "Crear Perfil de Empleado", "Asignar Equipo" "Extracción de Equipo", "Asignar Admin", "Agregar Proyecto"]
  end
end
