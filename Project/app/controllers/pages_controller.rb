class PagesController < ApplicationController
   before_action :authenticate_user!,
   :only => [:home2]
    
  def home
  end


  def home2

  end

  def home3
  end

  def login
  end
end
