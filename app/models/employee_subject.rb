class EmployeeSubject < ApplicationRecord
    belongs_to :subject
    belongs_to :employee 

    validates_uniqueness_of :employee_id, scope: :subject_id
end
