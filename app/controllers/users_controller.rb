class UsersController < ApplicationController

  def index
	@posts = Post.page(params[:page]).includes(:post_images, :category).per(50)
  end

  def new
  end

  def show
  	@user = User.find(params[:id])
  	@post = Post.find(params[:id])
    @orders = Order.all.includes(:user, :post)
  end

  def edit
  end

end
