class Empleado < ApplicationRecord
  has_many :project_assignments, dependent: :destroy
  has_many :proyectos, through: :project_assignments
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  # Validations for Empleado model
  validates :nombre, :apellido, :nacionalidad, :developer, presence: { message: "no puede estar en blanco" }
  validates :estado_civil, inclusion: { in: ["Soltero", "Casado", "Union Libre", "Divorciado", "Viudo"], message: "debe ser una opción válida" }
  validates :dni, :rtn, presence: true, uniqueness: true
  validates :contrato, inclusion: { in: ["Full-Time", "Part-Time", "Contratista", "Empleado No Activo"], message: "debe ser una opción válida" }
end
