class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /empleados
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  def show
    @employee = Employee.find(params[:id])
  end

  # GET /employees/new
  def new
    @employee = Employee.new employee_params
    @employee.build_address
  end

  # GET /employees/1/edit
  def edit
    @employee = Employee.find(params[:id])
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)  # Instantiate the @employee variable
    if @employee.save
      redirect_to @employee, notice: "El Perfil del Empleado fue creado exitosamente"
    else
      render :new
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      redirect_to employees_path, notice: "El Perfil del Empleado se actualizo exitosamente"
    else
      render :edit
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
    redirect_to employees_url, notice: "El Perfil del Empleado se ha eliminado exitosamente"
  end

  def associate_with_project
    @employee = Employee.find(params[:id])
    project_id = params[:employee][:project_ids] # Use project_ids

    if @employee && project_id
      project_assignment = ProjectAssignment.new(
        project_id: project_id,
        employee_id: @employee.id,
      )

      if project_assignment.save
        redirect_to @employee, notice: "Empleado vinculado a proyecto exitosamente."
      else
        # Handle save error if necessary
        redirect_to @employee, alert: "No se pudo vincular al proyecto."
      end
    end
  end

  def unlink_project
    @employee = Employee.find(params[:id])
    project_id = params[:employee][:project_ids] # Use project_ids

    if @employee && project_id
      # Find the project assignment to be destroyed
      project_assignment = ProjectAssignment.find_by(employee_id: @employee.id, project_id: project_id)

      if project_assignment
        if project_assignment.destroy
          redirect_to @employee, notice: "Proyecto desvinculado exitosamente."
        else
          # Handle destroy error if necessary
          redirect_to @employee, alert: "No se pudo desvincular el proyecto."
        end
      else
        redirect_to @employee, alert: "El proyecto no está vinculado con este empleado."
      end
    else
      redirect_to @employee, alert: "Error: No se pudo desvincular el proyecto. Por favor, seleccione un proyecto válido."
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def employee_params
    params.fetch(:employee, {}).permit(:nombre, :apellido, :nacionalidad, :estado_civil, :dni, :rtn, :contrato, :developer, address_attributes: [:id, :country, :state, :city, :address_line_1])
  end
end
