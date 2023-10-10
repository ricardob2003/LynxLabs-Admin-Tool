class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[ show edit update destroy ]

  # GET /inventories or /inventories.json
  def index
    @inventories = Inventory.filter_by_device(params[:name])
  end

  # GET /inventories/1 or /inventories/1.json
  def show
    @inventory = Inventory.find(params[:id])
    @task = Task.find_by(inventory_id: @inventory.id)
    @task ||= Task.new
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit
  end

  # POST /inventories or /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventories_path, notice: "El equipo se ha agregado exitosamente al inventario." }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1 or /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to inventories_path, notice: "El equipo se ha actualizado exitosamente al inventario." }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1 or /inventories/1.json
  def destroy
    @inventory.destroy

    respond_to do |format|
      format.html { redirect_to inventories_path, notice: "El equipo se ha eliminado exitosamente del inventario." }
      format.json { head :no_content }
    end
  end

  def task_history
    @inventory = Inventory.find(params[:id])
    @task = @inventory.task
    # Add any additional logic to retrieve and display task history if needed
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inventory_params
    params.require(:inventory).permit(:name, :model, :serial_number, :status, :entry_date, :lynx_id_number, :purchase_price, :current_cost, :warranty_expiration)
  end
end
