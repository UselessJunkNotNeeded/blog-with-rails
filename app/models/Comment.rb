class Comment < ApplicationRecord
  belongs_to :user, :post

  def update_comment_counter
    post.increment!(:comments_counter)
  end
end