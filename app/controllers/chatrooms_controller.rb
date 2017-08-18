class ChatroomsController < ApplicationController
  def index
    @chatroom = Chatroom.new
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end

  def edit
    @chatroom = Chatroom.find_by(id: params[:id])
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      respond_to do |format|
        format.html { redirect_to @chatroom }
        format.js
      end
    else
      respond_to do |format|
        flash[:notice] = {error: ["a chatroom with this topic already exists"]}
        format.html { redirect_to new_chatroom_path }
        format.js { render template: 'chatrooms/chatroom_error.js.erb'}
      end
    end
  end

  def update
    chatroom = Chatroom.find_by(id: params[:id])
    chatroom.update(chatroom_params)
    redirect_to chatroom
  end

  def show
    @chatroom = Chatroom.find_by(id: params[:id])
    @message = Message.new
    respond_to do |format|
      format.html { redirect_to "/chatrooms/#{@chatroom.id}" }
      format.js
    end
  end

  private

    def chatroom_params
      params.require(:chatroom).permit(:topic)
    end
end
