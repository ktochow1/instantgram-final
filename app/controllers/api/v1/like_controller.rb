class Api::V1::LikeController < ApplicationController

  def index
    render json: LikeSerializer.new(Like.all.last)
  end

  def update
    like = Like.find(params[:id])
    # binding.pry
    if like.valid?
      like.update(like_params)
      render json: LikeSerializer.new(like)
    end
  end

  private

  def like_params
    params.require(:like).permit(:id, :counter, :post_id)
  end
end
