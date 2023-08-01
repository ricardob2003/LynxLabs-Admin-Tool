class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :state
      t.string :city
      t.string :address_line_1
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
