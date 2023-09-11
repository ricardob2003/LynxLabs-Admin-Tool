class Address < ApplicationRecord
  belongs_to :employee
  validates :state, presence: { if: ->(record) { record.country.present? }, message: "no puede estar en blanco cuando el país tiene estados válidos" }
  validates :city, presence: { if: ->(record) { record.state.present? }, message: "no puede estar en blanco cuando el estado tiene ciudades válidas" }
  validates :address_line_1, presence: { message: "no puede estar en blanco" }
end
