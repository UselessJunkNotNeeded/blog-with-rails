class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, :likes

  def update_post_counter
    user.increment!(:posts_counter)
  end

  def recent_comments
    self.comments.limit(5)
  end

end