class Employee < ApplicationRecord
  has_secure_password
  has_many :campus_employees
  has_many :locations, through: :campus_employees
  has_many :employee_time_slots
  has_many :timeslots, through: :employee_time_slots
  has_many :employee_subjects
  has_many :subjects, through: :employee_subjects  
  has_many :messages
  has_one :chatroom

  validates :email, uniqueness:true
  validates :bio,  length: { maximum: 2000}
  
end
