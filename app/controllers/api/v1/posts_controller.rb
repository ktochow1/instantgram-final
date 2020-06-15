class Api::V1::PostsController < ApplicationController

  def index
    posts = Post.all
    # render json: posts, include: [:likes, :comments]
    render json: PostSerializer.new(posts)
  end

  def create
     post = Post.new(post_params)
     if post.save
       render json: post, status: :accepted #send status code to fetch request tells client if request rejected or passed
     else
       render json: {errors: post.errors}, status: :unprocessible_entity #this can be displayed to frontend
     end
  end

  def delete
    post = Post.find(post_params[:id])
    post.destroy
  end

  # def show
  #   post = Post.find(params[:id])
  #   render json: post
  # end

  def edit
    # post = Post.find(post_params[:id])
  end









  def update
    # binding.pry
    post = Post.find(params[:id])
    if post.valid?
      post.title = post_params[:title]
      post.image_url = post_params[:image_url]
      post.save
      render json: PostSerializer.new(post)
      # render json: post, status: :accepted
    else
      render json: {errors: post.errors.fullmessages}, status: :unprocessible_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :image_url)
  end
end
