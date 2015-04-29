class TeamController < ApplicationController
	def create
    
    #@team = current_user.teams.build(:req_id => params[:req_id])
     
  end
  
  #Adds to the pitch the current user mail as the requester and the request it and flash notice the submission of the request 
  #Monica
 def post
    @pitch =Pitch.find(params[:Add_Pitch_id_To_Pitches_Requestjoin])
    @pitch.Requestermail = current_user.email
    if @pitch.save
      flash[:notice] = "Request submitted pending for approval"
      redirect_to root_url
    else
      flash[:notice] = "Unable to send request"
      redirect_to root_url
    end
 end
    
  
# Adding a team 
#Monica
    def new
    @team = Team.new
  end

def index
      @team = Team.all
  end

#Deletes the request 
#Monica
  def destroy
    @team = current_user.teams.find(params[:email])
    @team.destroy
    flash[:notice] = "Rejected request"
    redirect_to current_user
  end
end


