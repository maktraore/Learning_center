class EmployeeSubjectsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
      # find employee timeslot by the id that you pass along
    employee_subject = EmployeeSubject.find_by(id: params[:id])
    employee_id = employee_subject.employee_id
    # destroy that association
    employee_subject.destroy
    # redirect back to the edit schedule page or wherever
    redirect_to "/employees/#{employee_id}/edit"
  end
end
