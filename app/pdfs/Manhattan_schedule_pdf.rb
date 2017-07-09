class ManhattanSchedulePdf < Prawn::Document
    def initialize
      super
      text "schedules "
    end
end