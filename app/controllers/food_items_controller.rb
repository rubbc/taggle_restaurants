class FoodItemsController < ApplicationController

  def new
    # we need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @food_item = FoodItem.new
  end

  def create
    @food_item = FoodItem.new(food_item_params)
    # we need `restaurant_id` to asssociate food_item with corresponding restaurant
    @food_item.restaurant = Restaurant.find(params[:restaurant_id])
    @food_item.save
  end

  private

  def food_item_params
    params.require(:food_item).permit(:name, :price, :description)
  end

end
