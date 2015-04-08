class FriendshipsController < ApplicationController

	def create
  @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
  if @friendship.save
    flash[:notice] = "Request submitted pending approval"
    redirect_to root_url
  else
    flash[:notice] = "Unable to join team."
    redirect_to root_url
  end
end

def destroy
  @friendship = current_user.friendships.find(params[:id])
  @friendship.destroy
  flash[:notice] = "Removed from team."
  redirect_to current_user
  end
def index
    #if params[:approved] == "false"
       @friendships = current_user.friendships.all
       # else
    #  @users = User.all
    #end
  end
  
  def approve_friendship
  friendship = Frienship.find(params[:id])
  friendship.approved = true
  if friendship.save
  end
  redirect_to :back
  end
  
end
