class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /empleados
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @employee.build_address
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to @employee, notice: "El Perfil del Empleado fue creado exitosamente"
    else
      render :new
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: "El Perfil del Empleado se actualizo exitosamente"
    else
      render :edit
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
    redirect_to employees_url, notice: "El Perfil del Empleado se ha eliminado exitosamente"
  end

  def states
    @target = params[:target]
    @states = CS.get(params[:country]).invert
    respond_to do |format|
      format.turbo_stream
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
