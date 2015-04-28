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
    @pitch.Requestermail = current_user.email
    @pitch.save
  end


  def create
    

    @pitch = Pitch.new(pitch_params)
    @pitch.Requestermail = current_user.email
    @pitch.Add_Pitch_id_To_Pitches_Requestjoin = params[:Add_Pitch_id_To_Pitches_Requestjoin]
    flash[:notice] = "Request submitted pending for approval"
       redirect_to root_url
    
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

#Add to the params of the pitch the requester mail and id of request (Monica)

  #private
  def pitch_params
    params.require(:pitch).permit(:title, :brief_description, :full_description, :url, :email, :username, :Requestermail , :Add_Pitch_id_To_Pitches_Requestjoin)
  end

end
