class Api::V1::LikeController < ApplicationController

  def index
    render json: LikeSerializer.new(Like.all.last)
  end

  def update
    like = Like.find(params[:id])
    if like.update(like_params)
      render json: LikeSerializer.new(like)
    end

    # if like.valid?
    #   like.update(like_params)
    #   like.save!
    # end
    # binding.pry
    # render json: LikeSerializer.new(like)
  end

  private

  def like_params
    params.require(:like).permit(:id, :counter, :post_id)
  end
end
