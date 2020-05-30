class Api::V1::CommentsController < ApplicationController

  def index
    render json: CommentSerializer.new(Comment.all)
  end

  def show
    comment = Comment.find(params[:id])
    render json: CommentSerializer.new(comment)
  end
end
