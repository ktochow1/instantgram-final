class Api::V1::LikesController < ApplicationController

  def index
    render json: LikeSerializer.new(Like.all)
  end

  def show
    like = Like.find(params[:id])
    render json: LikeSerializer.new(like)
  end

  private

  def like_params
    params.require(:like).permit(:likes)
  end
end
