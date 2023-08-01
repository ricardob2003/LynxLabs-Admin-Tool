require "test_helper"

class InventoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventory = inventories(:one)
  end

  test "should get index" do
    get inventories_url
    assert_response :success
  end

  test "should get new" do
    get new_inventory_url
    assert_response :success
  end

  test "should create inventory" do
    assert_difference("Inventory.count") do
      post inventories_url, params: { inventory: { current_cost: @inventory.current_cost, entry_date: @inventory.entry_date, insured: @inventory.insured, lynx_id_number: @inventory.lynx_id_number, model: @inventory.model, name: @inventory.name, purchase_price: @inventory.purchase_price, serial_number: @inventory.serial_number, status: @inventory.status, warranty_expiration: @inventory.warranty_expiration } }
    end

    assert_redirected_to inventory_url(Inventory.last)
  end

  test "should show inventory" do
    get inventory_url(@inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_inventory_url(@inventory)
    assert_response :success
  end

  test "should update inventory" do
    patch inventory_url(@inventory), params: { inventory: { current_cost: @inventory.current_cost, entry_date: @inventory.entry_date, insured: @inventory.insured, lynx_id_number: @inventory.lynx_id_number, model: @inventory.model, name: @inventory.name, purchase_price: @inventory.purchase_price, serial_number: @inventory.serial_number, status: @inventory.status, warranty_expiration: @inventory.warranty_expiration } }
    assert_redirected_to inventory_url(@inventory)
  end

  test "should destroy inventory" do
    assert_difference("Inventory.count", -1) do
      delete inventory_url(@inventory)
    end

    assert_redirected_to inventories_url
  end
end
