class ClaimsController < ApplicationController


  def create
    puts claim_params
    @claim = Claim.new(claim_params)
    @claim.save!
    redirect_to :back
  end

  private
  def claim_params
    params.require(:data).permit(:claimer_id, :post_id, :user_id)
  end
end
