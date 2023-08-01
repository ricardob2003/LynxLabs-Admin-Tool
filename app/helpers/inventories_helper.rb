module InventoriesHelper
  def display_inventory_errors(inventory)
    if inventory.errors.any?
      pluralized_errors = pluralize(inventory.errors.count, "errore")
      "Se presentaron #{pluralized_errors} que impidieron que el equipo se agregara al inventario."
    end
  end
end
