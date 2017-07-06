class Api::V1::EmployeesController < ApplicationController
  def index
    @json_array = Employee.all
  end

  def show
  end

end
