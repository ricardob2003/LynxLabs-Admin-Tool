class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

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
    redirect_to projects_url, status: :unprocessable_entity, notice: "Proyecto #{project.name} se ha eliminado exitosamente"
  end

  def link_employee
    @project = Project.find(params[:id])
    @employee = Employee.find(params[:employee_id])

    @project_assignment = ProjectAssignment.new(project: @project, employee: @employee)

    if @project_assignment.save
      flash[:notice] = "El Empleado se ha asignado exitosamente al proyecto"
    else
      flash[:alert] = "EL Empleado no se logro asignar exitosamente al proyecto"
    end

    redirect_to @project
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params_create
    params.require(:project).permit(:name, :cliente, :start_date, :end_date, :status, :bitacora_del_proyecto)
  end

  def project_params_edit
    params.require(:project).permit(:status, :end_date, :bitacora_del_proyecto)
  end
end
