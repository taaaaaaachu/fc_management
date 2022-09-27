class Public::CommentsController < ApplicationController
  before_action :authenticate_user!


  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.post_id = post.id
    comment.user_id = current_user.id
    comment.save
    redirect_to post_path(post)
  end

  def edit
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:post_id])
    unless @comment.user == current_user
      redirect_to post_path(@post)
    end
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    redirect_to post_path(comment.post)
  end

  def destroy
    comment = Comment.find(params[:post_id])
    post = comment.post_id
    comment.destroy
    redirect_to post_path(post)
  end


  private
    def comment_params
    params.require(:comment).permit(:comment, :user_id, :post_id)
    end
end
