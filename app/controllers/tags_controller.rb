class TagsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  # CREATE
  ########

  # READ
  ######

  def index
    @tags = Tag.all

  end

  # UPDATE
  ########

  def update
    tag = Tag.find(params[:id])
    tag.update(tag_params)
    redirect_to tags_path, notice: "Tag successfully updated: #{tag.name}"
  end

  # DESTROY
  #########

  #######
  private

  def tag_params
    params.require(:tag).permit(:name)  
  end
end
