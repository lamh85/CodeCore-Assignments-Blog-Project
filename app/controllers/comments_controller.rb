class CommentsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def create
    @post = Post.find params[:post_id]
    
    # Replacing:
    # @comment = Comment.new(comment_params)
    @comment = current_user.comments.new(comment_params)
    
    @comment.post = @post

    respond_to do |format|
      if @comment.save
        NewComment.notify_post_author(@comment).deliver_later
        format.html { redirect_to post_path(@post), notice: "Comment posted!" }
        format.js { render "create_success" }
      else
        format.html { render "posts/show" }
        format.js { render "create_failure" }
      end
    end
  end

  def destroy
    # @post = Post.find params[:post_id]
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: "Comment deleted" }
      format.js { render }
    end
  end

  def update
    # Note - Must assign values to @comment and post ID because although they are used to load the Edit page, the browser forgets the values before they are saved into the database.
    @comment = Comment.find(params[:id])
    @comment.post_id = params[:post_id]
    if @comment.update(comment_params)
      redirect_to post_path(params[:post_id]), notice: "Comment successfully updated!"
      # redirect_to post_path(@post), notice: "Comment successfully updated!"
    else
      render :edit
    end
  end

  def edit
    @post = Post.find params[:post_id]
    @comment = Comment.find params[:id]
    @comment.post = @post    
  end

  #######
  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
