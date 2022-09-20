class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index, :ranking]
  before_action :set_q, only: [:index, :search]

  def new
    @post = Post.new
    @post_details = @post.post_details.build
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # binding.pry
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

    graph_post_title = @post_details.pluck(:title)
    graph_post_price = @post_details.pluck(:price)

    gon.graph_post_title = graph_post_title
    gon.graph_post_price = graph_post_price

  end

  def index
    @posts = Post.all
    @post_details = PostDetail.all
  end

  def search
    @results = @q.result
  end

  def ranking
  end


  private

    def set_q
    @q = Post.ransack(params[:q])
    end

    def post_params
      params.require(:post).permit(:user_id, :is_public,
                                    post_details_attributes:[:id, :post_id, :genre_id, :custom_genre, :title, :price, :_destroy])
    end
end
