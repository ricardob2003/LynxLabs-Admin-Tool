class HomeController < ApplicationController
  def index
    @actions = {
      "Agregar al Inventario" => new_inventory_path,
      "Crear Perfil de Empleado" => new_employee_path,
      "Asignar Equipo" => assign_task_path,
      "Extracción de Equipo" => @task ? extract_task_path(@task) : nil,
      "Asignar Admin" => root_path,
      "Agregar Proyecto" => new_project_path,
    }

    # Define the @task variable with a specific task (change this based on application requirements)
    @task = Task.first
  end
end
