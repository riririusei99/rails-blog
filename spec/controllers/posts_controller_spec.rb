require 'rails_helper'

describe PostsController do
  # userを作成
  let(:user) { create(:user) }

  describe 'GET #new' do
    before do
      login_user user
    end
  
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do

    it "assigns the requested contact to @post" do
      # ユーザ作成・ログイン
      user = create(:user)
      login_user user
      # 投稿を登録
      post = create(:post, user_id: user.id)
      get :edit,  params: { id: post.id }
      expect(assigns(:post)).to eq post
    end

    it "renders the :edit template" do
      user = create(:user)
      login_user user
      post = create(:post, user_id: user.id)
      get :edit,  params: { id: post.id }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "populates an array of posts ordered by updated_at DESC" do
      user = create(:user)
      posts = create_list(:post, 3, user_id: user.id) 
      get :index
      expect(assigns(:posts)).to match(posts.sort{ |a, b| b.updated_at <=> a.updated_at } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "get correct post" do
      user = create(:user)
      post = create(:post, user_id: user.id) 
      get :show,  params: { id: post.id }
      expect(assigns(:post)).to eq post
    end
    
    it "get correct user" do
      user = create(:user)
      post = create(:post, user_id: user.id) 
      get :show,  params: { id: post.id }
      expect(assigns(:user)).to eq user
    end

    it "renders the :index template" do
      user = create(:user)
      post = create(:post, user_id: user.id) 
      get :show,  params: { id: post.id }
      expect(response).to render_template :show
    end
  end

end