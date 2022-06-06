class Like < ApplicationRecord
  belongs_to :user, :post

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
