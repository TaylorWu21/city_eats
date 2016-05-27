class RestaurantsController < ApplicationController
		before_action :city
		before_action :restaurant, only: [:show, :edit, :update, :destroy]

  def index
  	@restaurants = @city.restaurant
  end

  def show
  end

  def new
  	@restaurant = Restaurant.new
  end

  def create
  	@restaurant = @city.restaurant.new(restaurant_params)
  	if @restaurant.save
  		flash[:success] = "Restaurant with name: #{@restaurant.name} created."
  		city_restaurants_path(@restaurant)
  		redirect_to city_restaurant_path(@city, @restaurant)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @restaurant = @city.restaurant.find(params[:id])
  		flash[:success] = "Restaurant with name: #{@restaurant.name} has been updated."
  		redirect_to city_restaurant_path(@city, @restaurant)
  	else
  		render :edit
  	end
  end

  def destroy
  	name = @restaurant.name
  	flash[:success] = "Restaurant with name: #{name} has been destroyed."
  	redirect_to city_restaurants_path(@city)
  end

  private

  	def restaurant_params
  		params.require(:restaurant).permit(:name, :food_type, :cost_rating, :open, :take_out, :alcohol)
  	end
	
  	def restaurant
  		@restaurant = @city.restaurant.find(params[:id])
  	end

  	def city
  		@city = City.find(params[:city_id])
  	end
end
