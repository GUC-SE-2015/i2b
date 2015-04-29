class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # This method is to view all case studies in the database
  # Author: Hussien Kamal
  def index
    @blogs = Blog.all
  end

  # This method is to show a specific case study
  # Author: Hussien Kamal
  def show
  end

  # This method is to make a new instance from the case studies
  # Author : Hussien Kamal
  def new
    @blog = Blog.new
  end

  # This method is to edit a specific case study
  # Author: Hussien Kamal
  def edit
  end

  # This method is to submit a new case study
  # Author: Hussien Kamal
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Case was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # This method is to update a specific case study
  # Author: Hussien Kamal
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Case was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # This method is to delete a specific case study
  # Author: Hussien Kamal
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # This method identifies the case study parameters
    # Author: Hussien Kamal
    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
