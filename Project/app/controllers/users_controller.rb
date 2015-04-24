class UsersController < ApplicationController
  respond_to :html, :json

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


    def index
    #if params[:approved] == "false"
       @users = User.all
       # else
    #  @users = User.all
    #end
  end


  def edit1
    
  end

  

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    respond_with @user
  end
   
  def user_params
    params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password, :approved)
  end
  
  def approve_user
  user = User.find(params[:id])
  user.approved = true
  if user.save
  end
  redirect_to :back
  end

 
  # Other actions omitted.
 




end

