require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    before(:each) do
      @user = User.new(name: 'Tony stark', photo: 'link_to_photo', bio: 'I am iron man')
    end

    before {@user.save}

    it 'Check for name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'post_counter is an interger' do
      @user.posts_counter = 'spiderman'
      expect(@user).to_not be_valid
    end
  end
end
