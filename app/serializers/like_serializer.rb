class LikeSerializer
  include FastJsonapi::ObjectSerializer
  # attributes :likes#, :posts
  belongs_to :post
  #
  # def posts
  #   {post_title: self.object.post.title}
  # end
end
