class EmployeeTimeSlot < ApplicationRecord
  belongs_to :timeslot 
  belongs_to :employee 

  validates_uniqueness_of :employee_id, scope: :timeslot_id

end
