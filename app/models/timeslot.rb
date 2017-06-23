class Timeslot < ApplicationRecord
  belongs_to :location
  has_many :employee_time_slots
  has_many :employees, through: :employee_time_slots
end
