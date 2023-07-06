class ProyectosController < ApplicationController
  def index
    if params[:status].present?
      @proyectos = Proyecto.where(status: params[:status])
    else
      @proyectos = Proyecto.all
    end
  end

  def show
    @proyecto = Proyecto.find(params[:id])
  end

  def edit
    @proyecto = Proyecto.find(params[:id])
  end

  def update
    @proyecto = Proyecto.find(params[:id])
    # Update only the specified attributes
    if @proyecto.update(proyecto_params_edit)
      # Successfully updated, handle the response
      redirect_to(proyectos_path, notice: "Proyecto was successfully updated.")
    else
      # Failed to update, handle the error
      render :edit
    end
  end

  def new
    @proyecto = Proyecto.new
  end

  def create
    @proyecto = Proyecto.new(proyecto_params_create)
    @proyecto.save
    redirect_to(proyectos_path, notice: "Proyecto was successfully updated.")
  end

  def destroy
    @proyecto = Proyecto.find(params[:id])
    @proyecto.destroy
    redirect_to proyectos_url, status: :see_other
  end

  private

  def proyecto_params_create
    params.require(:proyecto).permit(:name, :cliente, :start_date, :end_date, :status, :bitacora_del_proyecto)
  end

  def proyecto_params_edit
    params.require(:proyecto).permit(:status, :end_date, :bitacora_del_proyecto)
  end
end
