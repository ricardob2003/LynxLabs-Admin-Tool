module InventoriesHelper
  def formatted_date(date)
    date ? date.strftime('%d %B %Y') : 'Inventario aún se encuentra asignado'
  end

  def formatted_employee(task)
    employee = Employee.find(task.employee_id)
    "#{employee.nombre} #{employee.apellido}"
  end

  def formatted_user(task)
    user = User.find(task.user_id)
    user.username
  end

  def formatted_inventory(task)
    inventory = Inventory.find(task.inventory_id)
    inventory.name
  end

  def formatted_task_type(task)
    task_type = task.task_type == 'assignment' ? 'Asignado' : 'Extraído'
  end

  def formatted_extraction_log(task)
    if task.extraction_log.nil? || task.extraction_log.empty?
      "El equipo no se ha extraído por los momentos"
    else
      task.extraction_log
    end
  end



end
