class UsersController < ApplicationController
  respond_to :html, :json
 
  # Other actions omitted.
 
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    respond_with @user
  end

end