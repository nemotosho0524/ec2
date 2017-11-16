class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :admin_user, only: [:edit, :update]
	
	add_breadcrumb 'Home', :posts_path

	def index
		@posts = Post.page(params[:page]).includes(:post_images).per(50)
	end

	def new
		@post = Post.new
		@post.post_images.build
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.save
		redirect_to post_path(@post)
	end

	def show
		add_breadcrumb @post.name, :post_path
	end

	def edit
		@post.user_id = current_user.id
		@post.save
	end

	def update
		@post.post_images.build
		@post.update(post_params)
		redirect_to posts_path
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

  private

	def set_post
	 @post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:name, :price, :description, :user_id, post_images_images: [])
	end

	def admin_user
		post = Post.find(params[:id])
		if current_user.admin_flg?
		else
			redirect_to root_path
		end
	end

end
