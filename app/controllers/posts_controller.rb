class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /posts
  # GET /posts.json
  def index
    if params[:order] == 'available'
       @posts = Post.where( :taken => false ).where('expiration > ?', Time.now)
    else
      @posts = Post.all
    end

    if params[:category_id]
      @posts = @posts.where( :category_id => params[:category_id])
    end
    @posts = @posts.order('CREATED_AT DESC')


    @post = Post.new
    @category = Category.all



  end

  def view_all
    if params[:expired == false && :taken == false]
      @post = Post.all
    end
  end
  # GET /posts/1
  # GET /posts/1.json
  def show
    @commentable = @post
    @comments = @commentable.comments
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
    @category = Category.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  # add expirationd date of 3 days to food posts
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.expiration = Time.now + 2.days

    respond_to do |format|
      if @post.save
        format.html { redirect_to :back, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to :back, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:description, :image, :title, :category_id, :location, :latitude, :longitude, :taken, :expiration)
    end
end
