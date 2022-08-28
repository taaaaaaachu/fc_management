class Public::PostsController < ApplicationController
  def new
    @post = Post.new
    @post_details = @post.post_details.build
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post)
  end

  def show
    @post = Post.find(params[:id])
    @post_details = @post.post_details
    @comment = Comment.new
  end

  def index
    @posts = Post.all
    @post_details = PostDetail.all
  end

  private

    def post_params
      params.require(:post).permit(:user_id, :is_public,
                                    post_details_attributes:[:id, :post_id, :genre_id, :custom_genre, :title, :price, :_destroy])
    end
end
