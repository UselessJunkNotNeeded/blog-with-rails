class User < ApplicationRecord
  has_many :posts, :comments, :likes

  def three_most_recent_posts
    self.posts.limit(3)
  end

end