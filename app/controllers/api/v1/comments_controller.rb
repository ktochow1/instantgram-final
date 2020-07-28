class Api::V1::CommentsController < ApplicationController

  def index
    comments = Comment.all.order("id")
    options = {
      include: [:post]
    }
    render json: CommentSerializer.new(comments, options)
    # binding.pry
  end

  def show
    comment = Comment.find(params[:id])
    render json: CommentSerializer.new(comment)
  end
  
  def create
    comment = Comment.create
    # binding.pry
    comment.post_id = params[:post_id].to_i
    comment.content = comment_params[:content]
    if comment.valid?
      comment.save!
    end
    render json: CommentSerializer.new(comment)
    
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
  private 

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
