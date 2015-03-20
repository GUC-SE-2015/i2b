class UsersController < ApplicationController
  respond_to :html, :json
    before_action :logged_in_user, only: [:edit, :update]
def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  def show
    @user = User.find(params[:id])
end
  def new
    @user = User.new 

  end

 
  def create
    @user = User.new(params[:user_params])
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "new"
  end



  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    respond_with @user
  end




   private

  def user_params
    params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
  end
end



