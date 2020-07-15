class Api::V1::LikeController < ApplicationController

  def index
    # binding.pry
    render json: LikeSerializer.new(Like.all.last)
  end

  def create
    binding.pry
    like = Like.create(like_params)
    like.post_id = params[:post_id].to_i
    if like.valid?
      like.save
      render json: LikeSerializer.new(like)
    else 
      render json: {errors: like.errors}
    end
  end

#   def create
#     # binding.pry
#     post = Post.create(post_params)
#     if post.valid?
#       post.save
#       render json: PostSerializer.new(post)
#      # render json: {errors: post.errors}, status: :unprocessible_entity
#    else
#      # render json: post, status: :accepted
#       render json: {errors: post.errors}, status: :unprocessible_entity #send status code to fetch request tells client if request rejected or passed
#      #this can be displayed to frontend
#    end
# end

  def update
    binding.pry
    like = Like.find(params[:id])
    if like.valid?
      like.update(like_params)
      render json: LikeSerializer.new(like)
    end
  end

  private

  def like_params
    params.require(:like).permit(:counter, :post_id)
  end
end
