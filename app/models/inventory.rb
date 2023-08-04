class Inventory < ApplicationRecord
  validates :name, :model, :entry_date, :warranty_expiration, presence: { message: "no puede estar en blanco" }
  validates :serial_number, presence: { message: "no puede estar en blanco" }, uniqueness: { message: "debe ser único" }
  validates :lynx_id_number, presence: { message: "no puede estar en blanco" }, uniqueness: { message: "debe ser único" }
  validates :purchase_price, presence: { message: "no puede estar en blanco" }, numericality: { greater_than_or_equal_to: 0, message: "debe ser un número mayor o igual a 0" }
  validates :current_cost, presence: { message: "no puede estar en blanco" }, numericality: { greater_than_or_equal_to: 0, message: "debe ser un número mayor o igual a 0" }
  validates :status, inclusion: { in: ["Disponible", "Asignado", "Fuera de Rotación", "En Reparación", "Vendido"], message: "debe ser una opción válida" }

  # Custom query for the Inventories Index action
  def self.filter_by_device(name)
    if name.present?
      where(name: name)
    else
      all
    end
  end
end
