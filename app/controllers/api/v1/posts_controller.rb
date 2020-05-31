class Api::V1::PostsController < ApplicationController

  def index
    posts = Post.all
    render json: posts, include: [:likes, :comments]
    # render json: PostSerializer.new(Post.all)
  end

  def create
     post = Post.new(post_params)
     # byebug
     if post.save
       render json: post, status: :accepted #send status code to fetch request tells client if request rejected or passed
     else
       render json: {errors: post.errors.fullmessages}, status: :unprocessible_entity #this can be displayed to frontend
     end
  end


  def show
    post = Post.find(params[:id])
    render json: post
  end
  #
  # def update
  #   post = Post.find_by(id: params[:id])
  #   binding.pry
  # end
  #
  # def edit
  #   post = Post.find_by(id: params[:id])
  #   if post.valid?
  #     render json: post
  #   else
  #     render json: {errors: post.errors.fullmessages}, status: :unprocessible_entity
  #   end
  # end

  # def delete
  # end

  private

  def post_params
    params.require(:post).permit(:title, :image_url)
  end
end
