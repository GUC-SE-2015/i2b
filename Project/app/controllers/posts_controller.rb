class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  #Author: OmarHisham
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  #Author: OmarHisham
  def show
  end

  # GET /posts/new
  #Author: OmarHisham
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  #Author: OmarHisham
  def edit
  end

  #this method is to Create new question and save it to table
  # Author: OmarHisham
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # this method is to popup notification after posting
  #Author: OmarHisham
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # this method is to remove from table
  # Author" OmarHisham
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    #this method is to Use callbacks to share common setup or constraints between actions.
    #Author: OmarHisham
    def set_post
      @post = Post.find(params[:id])
    end

    #this method is to Never trust parameters from the scary internet, only allow the white list through.
    #Author: OmarHisham
    def post_params
      params.require(:post).permit(:Category, :Question)
    end
end
