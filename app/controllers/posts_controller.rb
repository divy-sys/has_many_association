class PostsController < ApplicationController

  before_action :find_post, except: [:index, :create, :new]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
    else
      render :show
    end
  end

  private


  def find_post
    @post = Post.find_by_id params[:id]
  end

  def post_params
    params.require(:post).permit(:title, :description, )
  end
end
