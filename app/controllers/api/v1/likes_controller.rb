class Api::V1::LikesController < ApplicationController

  def index
    render json: LikeSerializer.new(Like.all)
  end

  private

  def like_params
    params.require(:like).permit(:likes)
  end
end
