class Api::V1::PostsController < ApplicationController

  def index
    posts = Post.all
    render json: posts, include: [:likes, :comments]
    # render json: PostSerializer.new(Post.all)
  end
<<<<<<< HEAD
=======

>>>>>>> 4028ae5dd138bef66b4a2cb81f65ad7cd4c41218

  def create
     post = Post.new(post_params)
     # byebug
     if post.save
       render json: post, status: :accepted #send status code to fetch request tells client if request rejected or passed
     else
       render json: {errors: post.errors.fullmessages}, status: :unprocessible_entity #this can be displayed to frontend
     end
  end
<<<<<<< HEAD
=======

  #
  # def create
  #    post = Post.new(post_params)
  #    # byebug
  #    if post.save
  #      render json: PostSerializer.new(post), status: :accepted #send status code to fetch request tells client if request rejected or passed
  #    else
  #      render json: {errors: post.errors.fullmessages}, status: :unprocessible_entity #this can be displayed to frontend
  #    end
  # end
>>>>>>> 4028ae5dd138bef66b4a2cb81f65ad7cd4c41218


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
<<<<<<< HEAD
=======

  # def update
  #   post = Post.find_by(id: params[:id])
  #   binding.pry
  # end
  #

>>>>>>> 4028ae5dd138bef66b4a2cb81f65ad7cd4c41218
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
