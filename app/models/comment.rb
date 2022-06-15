class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
  after_save :update_comment_counter
  after_destroy :decrement_comment_counter
  validates :text, presence: true, length: { maximum: 250 }

  def update_comment_counter
    post.increment!(:comments_counter)
  end

  def decrement_comment_counter
    post.decrement!(:comments_counter)
  end
end
