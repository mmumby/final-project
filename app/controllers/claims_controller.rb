class ClaimsController < ApplicationController

  def create
    @post_id = claim_params[:post_id]
    @commentable = Post.find(@post_id)
    @comment = @commentable.comments.new(content: "I'm interested in picking up this food!", user_id: current_user.id)
    @claim = Claim.new(claim_params)

    if @claim.save && @comment.save
        @owner = User.find(@claim.user_id)
        @client = User.find(@claim.claimer_id)
        if chatroom_exists?(@owner, @client)
          redirect_to "/posts/#{@post_id}"
        else
        @chatroom = Chatroom.new(topic: "Ticket: #{@claim.post_id}", claim_id: @claim.id, owner_id: @owner.id, client_id: @client.id)
          if @chatroom.save
            @message = Message.new(content: "#{@client.name} is interested in your post!", user_id: @client.id, recipient_id: @owner.id, chatroom_id: @chatroom.id)
            if @message.save
              redirect_to "/posts/#{@post_id}"
            end
          end
        end

    else
      redirect_back
    end

  end

  def chatroom_exists?(owner, client)
    if Chatroom.exists?(owner_id: ["#{owner.id}", "#{client.id}"]) || Chatroom.exists?(client_id: ["#{owner.id}", "#{client.id}"])
      true
    else
      false
    end
  end

  private

  def claim_params
    params.require(:data).permit(:claimer_id, :post_id, :user_id)
  end
end
