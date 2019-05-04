require 'rails_helper'
describe User do
  describe '#create' do
    
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
    
  end
end