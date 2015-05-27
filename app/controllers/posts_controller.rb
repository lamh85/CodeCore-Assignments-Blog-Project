class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:index, :show]

  # CREATE
  ########

  # This is the GET method. Not to be confused with create.
  def new
    @post = Post.new
  end

  # This is the POST method.
  # Not to be confused with def new, which is for GET.
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:notice] = "Post successfully saved!"
      redirect_to posts_path(@post)
    else
      render :new
    end
  end

  # READ
  ######

  def index
    @post = Post.all.order(created_at: :desc)
  end

  def show
    
    # Create the string to display the tags
    if @post.tags.count > 0
      @tags_array = []
      @post.tags.each do |tag|
        @tags_array << tag.name
      end
      @tags_string = @tags_array.to_s[1..-2].gsub "\"",""
    else
      @tags_string = "none"
    end

    # Get a variable ready for a new comment
    @comment = Comment.new

    # If the user is logged in, load the "favourite" record from the Favourite model.
    @favourite = @post.favourites.find_by_user_id(current_user.id) if user_signed_in?
  end

  # UPDATE
  ########

  def edit
  end

  def update
    if @post.update(post_params)
      # SAME AS: redirect_to post_path(id: @post.id)
      redirect_to post_path(@post), notice: "Post successfully updated!"
    else
      render :edit
    end
  end  

  # DESTROY
  #########

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Blog entry deleted successfully!"
  end

  #######
  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, {tag_ids: []})  
  end

end