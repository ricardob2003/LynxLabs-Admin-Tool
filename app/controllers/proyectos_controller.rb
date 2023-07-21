class ProyectosController < ApplicationController
  before_action :set_proyecto, only: [:show, :edit, :update, :destroy]

  def index
    @proyectos = Proyecto.filter_by_status(params[:status])
  end

  def show
  end

  def edit
    @proyecto = Proyecto.find(params[:id])
    @non_editable_attributes = {
      name: @proyecto.name,
      cliente: @proyecto.cliente,
      start_date: @proyecto.start_date,
    }
  end

  def update
    if @proyecto.update(proyecto_params_edit)
      redirect_to(proyectos_path, notice: "Proyecto se creo exitosamente")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @proyecto = Proyecto.new
  end

  def create
    @proyecto = Proyecto.new(proyecto_params_create)
    if @proyecto.save
      redirect_to(proyectos_path, notice: "Proyecto se creo exitosamente")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @proyecto.destroy
    redirect_to proyectos_url, status: :unprocessable_entity, notice: "Proyecto #{Proyecto.name} se ha eliminado exitosamente"
  end

  private

  def set_proyecto
    @proyecto = Proyecto.find(params[:id])
  end

  def proyecto_params_create
    params.require(:proyecto).permit(:name, :cliente, :start_date, :end_date, :status, :bitacora_del_proyecto)
  end

  def proyecto_params_edit
    params.require(:proyecto).permit(:status, :end_date, :bitacora_del_proyecto)
  end
end
