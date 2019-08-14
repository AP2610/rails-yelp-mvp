class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(accepted_params)
    @restaurant = Restaurant.find(params[:restaurant_id])

    @review.restaurant = @restaurant
    # raise

    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render :new
    end
  end

  private

  def accepted_params
    params.require(:review).permit(:content, :rating)
  end
end
