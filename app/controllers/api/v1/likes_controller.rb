class Api::V1::LikesController < ApplicationController

  def index
    render json: LikeSerializer.new(Like.all)
  end

  def create
    like = Like.new(like_params)
    if like.save
      render json: like, status: :accepted
    else
      render json: {errors: like.errors.fullmessages}, status: :unprocessible_entity #this can be displayed to frontend
    end
  end

  private

  def like_params
    params.require(:like).permit(:likes)
  end
end
