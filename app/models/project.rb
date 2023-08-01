class Project < ApplicationRecord
  has_many :project_assignments, dependent: :destroy
  has_many :employees, through: :project_assignments

  validates :name, :cliente, :start_date, :bitacora_del_proyecto, :end_date, presence: { message: "no puede estar en blanco" }
  validates :status, inclusion: {
                       in: ["Asignado", "Development", "Production", "Entregado"],
                       message: "el estatus del proyecto tiene que ser determinado",
                     }
  validates :bitacora_del_proyecto, length: { maximum: 500 }
  validate :end_date_after_start_date

  # Validate that the end_date will always be after the start_date
  def end_date_after_start_date
    if start_date.present? && end_date.present? && end_date < start_date
      errors.add(:end_date, "debe ser posterior a la fecha de asignación")
    end
  end

  # Custom query for the Projects Index action
  def self.filter_by_status(status)
    if status.present?
      where(status: status)
    else
      all
    end
  end
end
