class Task < ApplicationRecord
  belongs_to :employee
  belongs_to :equipment
end
