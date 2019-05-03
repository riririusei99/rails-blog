class UsersController < ApplicationController

  before_action :authenticate_user!, except: :sign_in

  def show
    @user = User.includes(:posts).find(params[:id])
    @posts = Post.order('created_at DESC').where(user_id: params[:id]).page(params[:page]).per(5)
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    if user.your_account?(current_user)
      user.update(update_params)
      redirect_to action: :show
    end
  end
  
  private
  def update_params
    params.require(:user).permit(:nickname, :email, :text, :image)
  end
end
