require 'rails_helper'
describe User do
  describe '#create' do
    
    it "is valid with title and post and user_id" do
      post = build(:post)
      create(:user, id: post[:user_id])
      expect(post).to be_valid
    end

    it "is invalid without title" do
      post = build(:post, title: "")
      post.valid?
      puts post.errors
      expect(post.errors[:title]).to include("can't be blank")
    end
    
    it "is invalid without :post" do
      post = build(:post, post: "")
      post.valid?
      puts post.errors
      expect(post.errors[:post]).to include("can't be blank")
    end
    
    it "is invalid without user_id" do
      post = build(:post, user_id: "")
      post.valid?
      puts post.errors
      expect(post.errors[:user_id]).to include("can't be blank")
    end

  end
end