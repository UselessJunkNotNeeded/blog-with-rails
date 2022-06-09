require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Like model' do
    before(:each) do
      @user = User.new(id: 20, name: 'Tony Stark', photo: 'photo', bio: 'I am iron man')
      @post = Post.new(author: @user, title: 'who batman', text: 'I am better than batman', comments_counter: 0,
                       likes_counter: 0)
      @like = Like.new(author_id: @user.id, post_id: @post.id)
    end

    it 'author_id exists' do
      @like.author_id = false
      expect(@like).not_to be_valid
    end

    it 'post_id exists' do
      @like.post_id = nil
      expect(@like).to_not be_valid
    end

    it 'like exists' do
      @post.update(likes_counter: 5)
      expect(@post.likes_counter).to eq 5
    end
  end
end
