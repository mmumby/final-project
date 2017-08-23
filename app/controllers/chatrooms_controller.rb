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

  def new_chat
    @owner = User.find(params[:data][:owner_id])
    @client = User.find(params[:data][:client_id])
    if chatroom_exists?(@owner, @client)
      redirect_to "/users/#{current_user.id}#menu2"
    else
    @chatroom = Chatroom.new(new_chat_params)
    if @chatroom.save
      @message = Message.new(content: "Hello!", user_id: @chatroom.owner_id, recipient_id: @chatroom.client_id, chatroom_id: @chatroom.id)
      if @message.save
        respond_to do |format|
          format.html {redirect_to "/users/#{current_user.id}" + "#menu2"}
        end
      end
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

  def chatroom_exists?(owner, client)
    if Chatroom.where("owner_id = ? AND client_id = ?", "#{owner.id}", "#{client.id}").exists? || Chatroom.where("owner_id = ? AND client_id = ?", "#{client.id}", "#{owner.id}").exists?
      true
    else
      false
    end
  end

  private

    def chatroom_params
      params.require(:chatroom).permit(:topic, :claim_id, :user_id, :client_id)
    end

    def new_chat_params
      params.require(:data).permit(:owner_id, :client_id)
    end
end
