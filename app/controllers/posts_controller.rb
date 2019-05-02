class PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = Post.order('created_at DESC').page(params[:page]).per(5)
  end
  
  def show
    @post = Post.where(id: params[:id])
  end
  
  def new
    @post = Post.new
  end

  def create
    Post.create(create_params)
  end
  
  private
  def create_params
    params.require(:post).permit(:title, :post).merge(user_id: current_user.id)
  end
end
