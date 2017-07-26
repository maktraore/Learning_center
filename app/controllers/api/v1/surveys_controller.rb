class Api::V1::SurveysController < ApplicationController
  def index
    @surveys = Survey.all
    render :index
  end

  def show
     survey = Survey.find_by(id: params[:id])
     @survey = survey.to_json
    # @question1 = survey.question1
    # @question2 = survey.question2
    # @question3 = survey.question3
    # @question4 = survey.question4
    # @question5 = survey.question5
    # @question6 = survey.question6
    # @question7 = survey.question7
    # @question8 = survey.question8
    # @question9 = survey.question9
    # @question10 = survey.question10
    # @question11 = survey.question11
    # @question12 = survey.question12
    # @question13 = survey.question13
    render :json => @survey
  end
end
