class Timeslot < ApplicationRecord
  belongs_to :location
  has_many :employee_time_slots
  has_many :employees, through: :employee_time_slots
  validates :start_time, :uniqueness => {:scope => [:end_time, :days, :location_id]}
end
