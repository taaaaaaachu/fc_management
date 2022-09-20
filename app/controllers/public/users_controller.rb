class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @liked_posts = @user.likes
    @posts = @user.posts

  end

  def unsubscribe
    @user = User.find(current_user.id)
  end

  def withdraw
    user = User.find(current_user.id)
    user.update(is_active: false)
    reset_session
    redirect_to root_path
  end
end
