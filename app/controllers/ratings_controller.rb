class RatingsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @rating = @user.ratings.new(rating_params)

    if @rating.save
      redirect_to :back
    end
  end

  private
  def rating_params
    params.require(:rating).permit(:rating)
  end

end
