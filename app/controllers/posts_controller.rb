class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all.order("created_at desc").paginate(page: params[:page], per_page: 10)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post, notice: "Post successfully saved"
		else
			render 'new', notice: "Unable to save post"
		end
	end

	def show
	end

	def edit
	end

	def update
		@post.slug = nil
		if @post.update(post_params)
			redirect_to @post, notice: "Post successfully updated"
		else
			render 'edit', notice: "Unable to update post"
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :content, :slug)
	end

	def find_post
		@post = Post.friendly.find(params[:id])
	end

end
