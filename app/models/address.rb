class Address < ApplicationRecord
  belongs_to :empleado, foreign_key: :empleado_id
  validates :country, inclusion: { in: ->(record) { record.states.keys }, allow_blank: true, message: "no es un pais valido" }
  validates :state, presence: { if: ->(record) { record.states.present? }, message: "no puede estar en blanco cuando el país tiene estados válidos" }
  validates :city, inclusion: { in: ->(record) { record.cities }, allow_blank: true, message: "no es un estado/ciudad válido" }
  validates :city, presence: { if: ->(record) { record.cities.present? }, message: "no puede estar en blanco cuando el estado tiene ciudades válidas" }
  validates :address_line_1, presence: true

  def countries
    CS.countries
  end

  def states
    CS.states(country).with_indifferent_access
  end

  def cities
    CS.cities(state, country) || []
  end
end
