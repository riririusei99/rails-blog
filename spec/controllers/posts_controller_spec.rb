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

end