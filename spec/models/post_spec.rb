require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post model' do
    before(:each) do
      @user = User.new(id: 1, name: 'Iron Man', photo: 'Iron_photo', bio: 'I am iron man')
      @post = Post.new(author: @user, title: 'Spiderman Sucks', text: 'Ten reasons why spiderman sucks',
                       comments_counter: 0, likes_counter: 0)
    end

    it 'whether atributes pass validation or not' do
      expect(@post).to be_valid
    end

    it 'check for title' do
      @post.title = nil
      expect(@post).not_to be_valid
    end

    it 'max 250 characters for title' do
      @post.title = 'Amber heard is a liar'
      expect(@post).to be_valid
    end

    it 'likes_counter is integer or not' do
      @post.likes_counter = 'bully'
      expect(@post).not_to be_valid
    end

    it 'likes_counter greater than or equal to zero' do
      @post.likes_counter = -1
      expect(@post).not_to be_valid
    end

    it 'comments_counter greater than or equal to zero.' do
      @post.comments_counter = -100
      expect(@post).not_to be_valid
    end

    it 'comments_counter is integer' do
      @post.comments_counter = 'xqc'
      expect(@post).not_to be_valid
    end

    it 'comments_counter is integer' do
      @post.comments_counter = 6
      expect(@post).to be_valid
    end
  end
end
