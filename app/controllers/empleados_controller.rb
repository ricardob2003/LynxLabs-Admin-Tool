class EmpleadosController < ApplicationController
  before_action :set_empleado, only: [:show, :edit, :update, :destroy]
  # GET /empleados
  def index
    @empleados = Empleado.all

    if params[:search].present?
      @empleados = @empleados.where("nombre LIKE ?", "%#{params[:search]}%") # Or whatever your search condition is
    end

    if params[:filter].present?
      @empleados = @empleados.where(contrato: params[:filter]) # Or whatever your filter condition is
    end
  end

  # GET /empleados/1
  def show
  end

  # GET /empleados/new
  def new
    @empleado = Empleado.new empleado_params
    @empleado.build_address empleado_params
  end

  # GET /empleados/1/edit
  def edit
  end

  # POST /empleados
  def create
    @empleado = Empleado.new(empleado_params)

    if @empleado.save
      redirect_to @empleado, notice: "El Perfil del Empleado fue creado exitosamente"
    else
      render :new
    end
  end

  # PATCH/PUT /empleados/1
  def update
    if @empleado.update(empleado_params)
      redirect_to @empleado, notice: "El Perfil del Empleado se actualizo exitosamente"
    else
      render :edit
    end
  end

  # DELETE /empleados/1
  def destroy
    @empleado.destroy
    redirect_to empleados_url, notice: "El Perfil del Empleado se ha eliminado exitosamente"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_empleado
    @empleado = Empleado.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def empleado_params
    params.fetch(:empleado, {}).permit(:nombre, :apellido, :nacionalidad, :estado_civil, :dni, :rtn, :contrato, :developer, address_attributes: [:id, :country, :state, :city, :address_line_1])
  end
end
