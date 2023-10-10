class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @inventory = @task.inventory
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  def create
    @employee = Employee.find(params[:task][:employee_id])
    @inventory = Inventory.find(params[:task][:inventory_id])
    @user = User.find(params[:task][:user_id])
    task_type = params[:task][:task_type]

    # Initialize task with form parameters, including date_of_extraction

    @task = Task.new(
      employee_id: @employee.id,
      inventory_id: @inventory.id,
      user_id: @user.id,
      task_type: task_type,
      assignment_log: params[:task][:assignment_log],
      date_of_extraction: nil, # Initialize date_of_extraction as nil
      date_of_assignment: params[:task][:date_of_assignment],
      extraction_log: params[:task][:extraction_log],
    )
    logger.debug(params.inspect)

    respond_to do |format|
      if @task.save
        @inventory.update(status: "Asignado")

        format.html { redirect_to inventories_path, notice: "El equipo fue asignado al empleado." }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  def update
    respond_to do |format|
      if @task.update(
        extraction_log: params[:task][:extraction_log],
        date_of_extraction: params[:task][:date_of_extraction],
        task_type: params[:task][:task_type],
      )
        @inventory = @task.inventory
        @inventory.update(status: "Disponible")

        flash[:notice] = "Inventario extraído exitosamente."
        redirect_to inventory_path(@inventory)
      else
        format.html do
          flash.now[:alert] = "No se pudo extraer el Equipo."
          render :show, status: :unprocessable_entity
        end
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:employee_id, :inventory_id, :user_id, :task_type, :date_of_assignment, :assignment_log, :date_of_extraction, :extraction_log)
  end
end
