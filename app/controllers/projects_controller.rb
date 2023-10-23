class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.filter_by_status(params[:status])
  end

  def show
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    if @project.update(project_params_edit)
      redirect_to(projects_path, notice: "Proyecto se actualizo exitosamente")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params_create)
    if @project.save
      redirect_to(projects_path, notice: "Proyecto se creo exitosamente")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, status: :unprocessable_entity, notice: "Proyecto #{@project.name} se ha eliminado exitosamente"
  end

  def link_employee
    @project = Project.find(params[:id])
    employee_id = params[:project][:employee_ids] # Use employee_ids

    if @project && employee_id
      @project.employees << Employee.find(employee_id) # Create the association
      redirect_to @project, notice: "Empleado vinculado exitosamente."
    else
      # Handle error case if necessary
      redirect_to @project, alert: "No se pudo vincular al empleado."
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params_create
    params.require(:project).permit(:name, :cliente, :start_date, :end_date, :status, :detalles_del_proyecto)
  end

  def project_params_edit
    params.require(:project).permit(:name, :cliente, :start_date, :end_date, :status, :detalles_del_proyecto)
  end
end
