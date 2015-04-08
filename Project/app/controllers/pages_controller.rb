class PagesController < ApplicationController
   before_action :authenticate_user!,
   :only => [:home2]
    
  def home
  end


  def home2
  	if current_user.admin?
  redirect_to :action => 'home3'
   end
  end

  def home3
  end

  def login
  end
end
