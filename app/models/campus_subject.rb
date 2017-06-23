class CampusSubject < ApplicationRecord
  belongs_to :subject
  belongs_to :location
end
