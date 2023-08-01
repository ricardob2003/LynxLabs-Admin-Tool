json.extract! inventory, :id, :name, :model, :serial_number, :status, :entry_date, :lynx_id_number, :purchase_price, :current_cost, :warranty_expiration, :insured, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
