class PitchesController < ApplicationController
  respond_to :html, :json

   # http_basic_authenticate_with name: "nageeb", password: "12345678", except: [:index, :show]

  # This mehod is showing all the pitches
  # Author Naguib

  def index
      @pitches = Pitch.all
  end

  # This mehod is to show the selected idea
  # Author Naguib
  def show
    @pitch = Pitch.find(params[:id])
  end

  # This mehod is to initialize new idea
  # Author Naguib

  def new
      @pitch = Pitch.new
  end

  # This mehod creates the idea created in the new method
  # Author Naguib
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

  # This mehod edits the idea 
  # Author Naguib
  def update
      @pitch = Pitch.find(params[:id])
 
      if @pitch.update(pitch_params)
        redirect_to @pitch
      else
        render 'edit'
      end
  end

  # This mehod is deleting the selected idea
  # Author Naguib
  def destroy
    @pitch = Pitch.find(params[:id])
    @pitch.destroy
    redirect_to pitches_path 
  end
  
  #This method is that the ideaConsultant is to be evaluated by the ideator 
  #Author Mariam Afifi
  def evaluateIdeaConsultant
    @pitch = Pitch.find(params[:id])
    if ! current_user.is_Ideator?
      redirect_to pitches_path, alert: "you are not allowed to evaluate"
    end
 end

  #This method is to submit the evaluation form
  #Author Mariam Afifi
  def submitTheForm
    user = User.find_by_email(params[:IdeaConsultantEmailAddress])
    if user.nil?
      redirect_to pitches_path, alert: "you are not an ideator"
    else
      redirect_to pitches_path, notice: "The form has been submitted successfuly"
    end
  end


  private
  
  def pitch_params
    params.require(:pitch).permit(:title, :brief_description, :full_description, :url, :email)
  end
end

