class EmployeesSchedulesPdf < Prawn::Document
    def initialize
      super
      text "schedules "
    end
end