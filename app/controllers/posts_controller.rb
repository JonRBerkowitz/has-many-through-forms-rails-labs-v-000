class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @post.comments.build
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.categories.build(name: 'Enter a name')
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post
  end


  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name], comments_attributes: [:content], users_attributes: [:username])
  end
end
