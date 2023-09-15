class Task < ApplicationRecord
  belongs_to :employee, class_name: "Employee", foreign_key: "assigned_to_id"
  belongs_to :inventory
  belongs_to :user
end
