class CampusEmployee < ApplicationRecord
    belongs_to :employee 
    belongs_to :location
    
    validates_uniqueness_of :employee_id, scope: :location_id
end
