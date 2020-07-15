class Api::V1::PostsController < ApplicationController

  def index
    posts = Post.all
    # render json: posts, include: [:likes, :comments]
    render json: PostSerializer.new(posts)
  end

  def create
      # binding.pry
      post = Post.create(post_params)
      if post.valid?
        post.save
        render json: PostSerializer.new(post)
       # render json: {errors: post.errors}, status: :unprocessible_entity
     else
       # render json: post, status: :accepted
        render json: {errors: post.errors}, status: :unprocessible_entity #send status code to fetch request tells client if request rejected or passed
       #this can be displayed to frontend
     end
  end

  def destroy
    #how to remove object from dom without refresh
    post = Post.find(params[:id])
    post.destroy
    # render body: nil, status: :no_content
  end

  def update
    post = Post.find(params[:id])
    binding.pry
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

  def show 
    post = Post.find(params[:id])
    render json: post
  end

  private

  def post_params
    params.require(:post).permit(:title, :image_url)
  end
end
