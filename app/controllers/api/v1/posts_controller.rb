class Api::V1::PostsController < ApplicationController

  def index
    posts = Post.all.order("id")
    options = {
      include: [:comments]
    }
    # binding.pry
    # binding.pry
    render json: PostSerializer.new(posts, options)
  end

  def create
    binding.pry
      post = Post.new
      post.title = post_params[:title]
      post.image_url = post_params[:image_url]
      if post.valid?
        post.save
      end
      render json: PostSerializer.new(post) 
      #  binding.pry
    #   if post.valid?
    #     post.save
    #     render json: PostSerializer.new(post)
    #    # render json: {errors: post.errors}, status: :unprocessible_entity
    #  else
    #    # render json: post, status: :accepted
    #     render json: {errors: post.errors}, status: :unprocessible_entity #send status code to fetch request tells client if request rejected or passed
    #    #this can be displayed to frontend
    #  end
  end

  def destroy
    #how to remove object from dom without refresh
    post = Post.find(params[:id])
    # binding.pry
    post.destroy
    # render body: nil, status: :no_content
  end

  def update
    post = Post.find(params[:id])
    if post_params[:likes] == nil 
      post.title = post_params[:title]
      post.image_url = post_params[:image_url]
      post.likes = post.likes
      post.save
    else 
      post.likes = post_params[:likes]
      post.title = post.title 
      post.image_url = post.image_url
      post.save
    end
    # binding.pry
    render json: PostSerializer.new(post)
    # binding.pry
  end

  def show 
    post = Post.find(params[:id])
    render json: post
  end

  private

  def post_params
    params.require(:post).permit(:title, :image_url, :likes, comments_attributes: [:id, :content, :post_id])
  end
end
