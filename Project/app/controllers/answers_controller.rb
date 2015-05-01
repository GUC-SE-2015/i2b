class AnswersController < ApplicationController

  def index
  	 #@post = Post.find(params[:post_id])
     # @answers = @post.answers 
     @answers = Answer.all
  end

  def show
     # if  current_user.is_Ideator || current_user.is_Idea_Consultant || current_user.admin
  	@post = Post.find(params[:post_id])
    @answer = @post.answers.find(params[:id])
   
  end

  def new
  	 @post = Post.find(params[:post_id])
    @answer  = @post.answers .build
  end

  def edit
  	@post = Post.find(params[:post_id])
    @answer = @post.answers .find(params[:id])
  end
#This method : checks if consultant then can answer question creates a new answer and adds it to the answer table
#Author :Monica
  def create
    @post = Post.find(params[:answer][:post_id])
  if current_user.is_Idea_Consultant 
    
      @ans = Answer.new(:body => params[:answer][:body], :Answerer => current_user.email)
      @post.answers << @ans
      @post.save
          if @ans.save
            redirect_to post_url(@post)
           else
            render :action => "new"
          end
  else
    #redirect_to :back
    redirect_to post_url(@post)
    flash[:notice] = "Not Permitted to Answer"
      end
 end
 #This method : allows updating the values for the answer
 #Author :Monica
  def update
    @post = Post.find(params[:post_id])
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(params[:answer])
      redirect_to post_answer_url(@post, @answer)
    else
      render :action => "edit"
    end
  end
# This method :To delete the answer from the database 
#Author :Monica
   def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
 
    redirect_to answers_path
  end

  private
    def answer_params
      params.require(:answer).permit(:body, :post_id)
    end
end

