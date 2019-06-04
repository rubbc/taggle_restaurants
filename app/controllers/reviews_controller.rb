class ReviewsController < ApplicationController
def new
    # we need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end


  def sections
    @restaurant = Restaurant.find(params[:restaurant_id])
    @sections = %w(entrées plats desserts)
  end

  private

  def review_params
    params.require(:review).permit(:content, :price, :section)
  end
end
