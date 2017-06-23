class Subject < ApplicationRecord
  has_many :employee_subjects
  has_many :employees, through: :employee_subjects  
  has_many :campus_subjects
  has_many :locations, through: :campus_subjects
end
