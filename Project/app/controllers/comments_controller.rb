class CommentsController < ApplicationController
  def create
    @pitch = Pitch.find(params[:id])
    @comment = @pitch.comments.create(comment_params)
    redirect_to pitch_path(@pitch)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end