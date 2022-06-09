require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    before(:each) do
      @user = User.new(id: 1, name: 'Tony Stark', photo: 'photo', bio: 'I am iron man')
      @post = Post.new(author: @user, title: 'who batman', text: 'I am better than batman', comments_counter: 0,
                       likes_counter: 0)
      @comment = Comment.new(text: 'No, batman is the best', author_id: @user.id, post_id: @post.id)
    end

    it 'check for the title' do
      @comment.text = nil
      expect(@comment).to_not be_valid
    end

    it 'author_id is a integer' do
      @comment.author_id = 'text'
      expect(@comment).to_not be_valid
    end

    it 'post_id is a integer' do
      @comment.post_id = 'text'
      expect(@comment).to_not be_valid
    end
  end
end
