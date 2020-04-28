class Api::V1::PostsController < ApplicationController

  def index
    render json: PostSerializer.new(Post.all)
  end

  def show
    post = Post.find(params[:id])
    render json: PostSerializer.new(post)
  end

  private

  def post_params
    params.permit(:title, :image_url)
  end
end
