require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Creation' do
    before do
      user = User.create(email: 'a@b.c', password: '000000', password_confirmation: '000000', first_name: 'a', last_name: 'b')
      @post = Post.create(date: Date.today, rationale: 'Anything', user_id: user.id)
    end

    it 'can be created' do
      expect(@post).to be_valid
    end

    it 'cannot be created without a date or rationale' do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end
  end
end
