class ClaimsController < ApplicationController


  def create
    @post_id = claim_params[:post_id]
    @commentable = Post.find(@post_id)
    @comment = @commentable.comments.new(content: "#{current_user.name} is interested in picking up this food!", user_id: current_user.id)
    @claim = Claim.new(claim_params)
    if @claim.save && @comment.save
      redirect_to "/posts/#{@post_id}"
    else
      redirect_back
    end
  end

  private
  def claim_params
    params.require(:data).permit(:claimer_id, :post_id, :user_id)
  end
end
