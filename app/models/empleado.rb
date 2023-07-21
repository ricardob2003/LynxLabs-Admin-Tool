class Empleado < ApplicationRecord
  has_many :project_assignments, dependent: :destroy
  has_many :proyectos, through: :project_assignments
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
end
