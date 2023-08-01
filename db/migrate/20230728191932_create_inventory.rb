class CreateInventory < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.string :name
      t.string :model
      t.string :serial_number
      t.string :status
      t.date :entry_date
      t.string :lynx_id_number
      t.integer :purchase_price
      t.integer :current_cost
      t.date :warranty_expiration

      t.timestamps
    end
  end
end
