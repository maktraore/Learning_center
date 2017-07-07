class PhotosController < ApplicationController
  def new
  end
   def create
    @employee = Employee.find_by(id:params[:id])
    @photo = Photo.new(title: params[:title], image: params[:image], employee_id: current_user.id)
     # )
    if @photo.save
      flash[:success] = "The photo was added!"
      redirect_to "/employees/#{current_user.id}"
    else
      render :new
    end
  end
  def edit
    render :new
  end
  def update
    Photo.where(employee_id:current_user.id).first.destroy
    if Photo.where(employee_id:current_user.id).first.
    Photo.create(title:params[:title], image:params[:image], employee_id:current_user.id)
  end
    redirect_to "/employees/#{current_user.id}"
 end
end
