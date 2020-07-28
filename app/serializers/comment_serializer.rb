class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :post
  belongs_to :post

  # def blog
  #   {post_title: self.object.post.title}#post_title: self.object.post.title}
  # end
end
