class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def three_most_recent_posts
    posts.limit(3)
  end
end
