class Location < ApplicationRecord
  has_many :timeslots
  has_many :campus_employees
  has_many :employees, through: :campus_employees
  has_many :campus_subjects
  has_many :subjects, through: :campus_subjects
end
