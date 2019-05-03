class PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = Post.order('updated_at DESC').page(params[:page]).per(5)
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
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(update_params)
    redirect_to action: :index
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to action: :index
  end
  
  private
  def create_params
    params.require(:post).permit(:title, :post).merge(user_id: current_user.id)
  end
  
  def update_params
    params.require(:post).permit(:title, :post)
  end
end
