class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:index, :show]

  # This is the POST method.
  # Not to be confused with def new, which is for GET.
  def create
    # @post = Post.new(post_params)
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:notice] = "Post successfully saved!"
      # redirect_to post_path(id: @post.id)
      redirect_to posts_path(@post)
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Blog entry deleted successfully!"
  end

  def edit
  end

  def index
    @post = Post.all.order(created_at: :desc)
  end

  # This is the GET method. Not to be confused with create.
  def new
    @post = Post.new
  end

  def show
    @comment = Comment.new

    # If the user is logged in, load the "favourite" record from the Favourite model.
    @favourite = @post.favourites.find_by_user_id(current_user.id) if user_signed_in?
  end

  def update
    if @post.update(post_params)
      # SAME AS: redirect_to post_path(id: @post.id)
      redirect_to post_path(@post), notice: "Post successfully updated!"
    else
      render :edit
    end
  end

  #######
  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
