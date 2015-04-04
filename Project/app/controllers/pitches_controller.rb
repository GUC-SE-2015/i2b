class PitchesController < ApplicationController
  respond_to :html, :json

  def new
  	 
  end

  def create
    
  end


  def index
    
  end


  def edit1
    
  end

  

  def update
    
  end



   
  def pitcj_params
    params.require(:pitch).permit(:title, :brief_description, :full_description, :email)
  end

 
  # Other actions omitted.
 




end

