# This controller is to generate comments
#Author Bergitte
class BlogsCommentsController < ApplicationController
	 def create
    @blog = Blog.find(params[:blog_id])
    @blogComment = @blog.BlogComments.create(blogComment_params)
    redirect_to blog_path(@blog)
  end
 
  private
    def comment_params
      params.require(:blogComment).permit(:commenter, :body)
    end

end