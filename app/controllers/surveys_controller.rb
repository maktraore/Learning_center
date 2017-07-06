class SurveysController < ApplicationController
  def index
    @survey = Survey.new
  end
  def create
    @user =Survey.create(
   student_email: params[:student_email],
    question1: params[:question1],
    question2: params[:question2],
    question3: params[:question3],
    question4: params[:question4],
    question5: params[:question5],
    question6: params[:question6],
    question7: params[:question7],
    question8: params[:question8],
    question9: params[:question9],
    question10: params[:question10],
    question11: params[:question11],
    question12: params[:question12],
    question13: params[:question13]     
        
      )
    redirect_to "/surveys"
    UserMailer.survey_confirmation_email(@user).deliver_now
    # binding.pry
  end
  def show
  end
  def edit 
  end

  def update
  end
end
