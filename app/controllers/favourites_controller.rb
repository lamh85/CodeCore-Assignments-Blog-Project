class FavouritesController < ApplicationController

  before_action :authenticate_user!

  def index
    # Take all of the Favourite records whose user_id matches the current user. Store the records in @favourites
    @favourites = current_user.favourites
  end

  def create
    # Find the post record based on the ID from the previous webpage
    post = Post.find params[:post_id]
    # Create a new record in the Favourite model
    favourite = current_user.favourites.new
    # For the whole Post record that is associated with this Favourite record. Define that whole Post record via post_id. IE) Change the Favourite's Post to...
    favourite.post = post

    if favourite.save
      redirect_to post, notice: "This blog post is added to your Favourites!"
    else
      redirect_to post, alert: "This post is not added to your Favourites."
    end
  end

  def destroy
    favourite = current_user.favourites.find params[:id]
    favourite.destroy
    redirect_to favourite.post, notice: "This blog post is removed from your Favourites!"
  end

end