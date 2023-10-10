class Task < ApplicationRecord
  enum task_type: { assignment: "assignment", extraction: "extraction" }
  belongs_to :employee, class_name: "Employee", foreign_key: "employee_id"
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :inventory
end
