class ClaimsController < ApplicationController


  def create
    @post_id = claim_params[:post_id]
    @claim = Claim.new(claim_params)
    @claim.save!
    redirect_to "/posts/#{@post_id}"
  end

  private
  def claim_params
    params.require(:data).permit(:claimer_id, :post_id, :user_id)
  end
end
