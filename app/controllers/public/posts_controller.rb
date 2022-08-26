class Public::PostsController < ApplicationController
  def new
    @post = Post.new
    @post_details = @post.post_details.build
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
  end
end
