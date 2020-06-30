class LikeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :counter, :post_id
  belongs_to :post
  #
  # def posts
  #   {post_title: self.object.post.title}
  # end
end
