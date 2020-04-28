class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :image_url
  has_many :likes
  has_many :comments

  def likes
    self.object.likes.map do |like|
      {like: like.likes}
    end
  end

  def comments
    self.object.comments.map do |comment|
      {content: comment.content}
    end
  end

end
