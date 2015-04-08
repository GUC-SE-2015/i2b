class FriendshipsController < ApplicationController
 def create
    @friendship = current_user.friendships.build(:req_id => params[:req_id])
    if @friendship.save
      flash[:notice] = "Request submitted pending for approval"
      redirect_to root_url
    else
      flash[:notice] = "Unable to send request"
      redirect_to root_url
    end
  end
  

def index
      @friendships = Friendship.all
  end


  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Rejected request"
    redirect_to current_user
  end
end

