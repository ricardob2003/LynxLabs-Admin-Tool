class ProjectsController < ApplicationController
  before_action :set_proyecto, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.filter_by_status(params[:status])
  end

  def show
  end

  def edit
    @project = Project.find(params[:id])
    @non_editable_attributes = {
      name: @project.name,
      cliente: @project.cliente,
      start_date: @project.start_date,
    }
  end

  def update
    if @project.update(proyecto_params_edit)
      redirect_to(proyectos_path, notice: "Proyecto se actualizo exitosamente")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(proyecto_params_create)
    if @project.save
      redirect_to(proyectos_path, notice: "Proyecto se creo exitosamente")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to proyectos_url, status: :unprocessable_entity, notice: "Proyecto #{project.name} se ha eliminado exitosamente"
  end

  private

  def set_proyecto
    @project = Project.find(params[:id])
  end

  def proyecto_params_create
    params.require(:project).permit(:name, :cliente, :start_date, :end_date, :status, :bitacora_del_proyecto)
  end

  def proyecto_params_edit
    params.require(:project).permit(:status, :end_date, :bitacora_del_proyecto)
  end
end
