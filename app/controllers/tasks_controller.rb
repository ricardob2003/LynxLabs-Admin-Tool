class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @inventory = Inventory.find(params[:id])
    @task = @inventory.tasks.find_by(:status)
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
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

  # POST /tasks/:id/assign_equipment
  def assign_equipment
    @employee = Employee.find(params[:task][:employee_id])
    @inventory = Inventory.find(params[:id])
    @user = User.find(params[:task][:assigned_by_id])
    @task = Task.new(assigned_by: @user, employee: @employee, inventory: @inventory)

    respond_to do |format|
      if @task.save
        # Update the status of the related inventory to "Asignado"
        @inventory.update(status: "Asignado")

        format.html { redirect_to @employee, notice: "El equipo fue asignado al empleado." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def extract_equipment
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.extract_equipment
        @inventory.update(status: "Disponible")
        flash[:notice] = "Equipment extraido successfully."
        redirect_to inventory_path(@task.inventory)
      else
        format.html do
          flash.now[:alert] = "No se pudo extraer el Equipo."
          render :show, status: :unprocessable_entity
        end
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def assign_params
    params.require(:task).permit(:date_of_assignment, :equipment_log, :employee_id, :assigned_by_id)
  end

  def extraction_params
    params.require(:task).permit(:date_of_extraction, :extraction_log)
  end
end
