# This controller is to take the user data from current user 
# Author Bergitte
class ProfilesController < ApplicationController
   before_action :authenticate_user!
   
  def profile
  end
