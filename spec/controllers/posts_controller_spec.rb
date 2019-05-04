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

end