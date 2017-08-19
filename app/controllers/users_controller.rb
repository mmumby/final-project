class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = Post.joins(:user).where(:posts => { :user_id => @user.id })
    @commentable = @user
    @comments = @commentable.comments
    @comment = Comment.new
    @chatroom = Chatroom.where(["owner_id = ? or client_id = ?", @user.id, @user.id])
    @message = Message.new
  end
end
