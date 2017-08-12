class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.joins(:user).where(:posts => { :user_id => @user.id })
  end
end
