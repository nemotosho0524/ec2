class UsersController < ApplicationController

  def index
	@posts = Post.all.includes(:post_images)
  end

  def new
  end

  def show
  end

  def edit
  end

end
