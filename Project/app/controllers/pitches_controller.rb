class PitchesController < ApplicationController

  respond_to :html, :json


    # http_basic_authenticate_with name: "nageeb", password: "12345678", except: [:index, :show]


  def index
      @pitches = Pitch.all
  end

  def show
    if  current_user.is_Ideator || current_user.is_Idea_Consultant || current_user.admin
        @pitch = Pitch.find(params[:id])
        @consultancies = @pitch.consultancies
    else
      redirect_to :back
    end
  end

  def new
    @pitch = Pitch.new
  end


  def create
    @pitch = Pitch.new(pitch_params)
    if @pitch.save
      redirect_to @pitch
    else
      render 'new'
    end
  end


  def edit
      @pitch = Pitch.find(params[:id])

  end

  def update

      @pitch = Pitch.find(params[:id])
      if @pitch.update(pitch_params)
        redirect_to @pitch
      else
        render 'edit'
      end
  end


    def destroy
    @pitch = Pitch.find(params[:id])
    @pitch.destroy
 
    redirect_to pitches_path
  end


  #private
  def pitch_params
    params.require(:pitch).permit(:title, :brief_description, :full_description, :url, :email, :username)
  end







 #This method is that the ideaConsultant is to be evaluated by the ideator 
 #Author: Mariam Afifi
  def evaluateIdeaConsultant
     @pitch = Pitch.find(params[:id])
    if ! current_user.is_Ideator?
    redirect_to pitches_path, alert: "you are not allowed to evaluate"
    end
 end
 

 #This method is to submit the evaluation form
 #Author: Mariam Afifi
  def submitTheForm
  user = User.find_by_email(params[:IdeaConsultantEmailAddress])
  if user.nil?
    redirect_to pitches_path, alert: "He is not an idea consultant"
  else
    redirect_to pitches_path, notice: "The form has been submitted successfuly"
 end
end

 #This method is to post the evaluation 
 #Author: Mariam Afifi
  def submitTheEvaluation
  @pitch = Pitch.find(params[:id])
  if current_user.is_Idea_Consultant
     current_user.evalutions.create(pitch: @pitch, comment: params[:Evaluate])
     redirect_to @pitch, notice: "your evaluation has been posted"
  else
     redirect_to @pitch, alert: "you are not allowed to evaluate"
    end
  end

end
