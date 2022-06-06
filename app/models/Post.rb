class Post < ApplicationRecord
  after_save :update_post_counter
  belongs_to :user
  has_many :comments
  has_many :likes

  def update_post_counter
    user.increment!(:posts_counter)
  end

  def recent_comments
    comments.limit(5)
  end
end