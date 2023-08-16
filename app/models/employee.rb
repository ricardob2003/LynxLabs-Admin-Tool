class Employee < ApplicationRecord
  has_many :project_assignments, dependent: :destroy
  has_many :projects, through: :project_assignments
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :tasks
  has_many :inventory, through: :tasks

  # Validations for Employee model
  validates :nombre, :apellido, :nacionalidad, :developer, presence: { message: "no puede estar en blanco" }
  validates :estado_civil, inclusion: { in: ["Soltero", "Casado", "Union Libre", "Divorciado", "Viudo"], message: "debe ser una opción válida" }
  validates :dni, :rtn, presence: { message: "tiene que ser un número válido y único" }, uniqueness: true
  validates :contrato, inclusion: { in: ["Activo", "No Activo"], message: "no es una opción válida" }
end
