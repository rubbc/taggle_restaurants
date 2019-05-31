class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  # GET /restaurants.json

  def index
    @restaurants = Restaurant.all
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @restaurants = Restaurant.search(@name)
    else
      @restaurants = Restaurant.all.sample(3)
    end

    @all_restaurants = Restaurant.all
    @liste_arrondissements = []
    @all_restaurants.each do |restaurant|
      @liste_arrondissements << restaurant.arrondissement_list.first.to_i
    end
    @liste_arrondissements.sort! { |a, b| a <=> b }
    @liste_arrondissements.uniq!
  end



  def most_used_tags
    @most_used_tags = ActsAsTaggableOn::Tag.most_used(3)
  end

  def all_arr

  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @restaurants = Restaurant.all
    @restaurant = Restaurant.find(params[:id])
    @related_restaurants = @restaurant.find_related_tags
  end

  def tagged
    if params[:tag].present?
      @restaurants = Restaurant.tagged_with(params[:tag])
    else
      @restaurants = Restaurant.all
    end
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :tag_list)
    end
end
