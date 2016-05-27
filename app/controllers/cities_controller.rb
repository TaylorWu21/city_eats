class CitiesController < ApplicationController
    before_action :city, except: [:index, :new, :create]
  def index
      @cities = City.all.by_name
  end

  def show
  end

  def new
      @city = City.new
  end

  def create
      @city = City.new(city_params)
      if @city.save
          flash[:success] = "City with name: #{@city.name} created!"
          redirect_to city_path(@city)
      else
          render :new
      end
  end

  def edit
  end

  def update
      if @city.update(city_params)
          flash[:success] = "City with name: #{@city.name} updated!"
          redirect_to city_path(@city)
      else
          render :edit
      end
  end

  def destroy
      city_name = @city.name
      @city.destroy
      flash[:success] = "City with name: #{@city.name} destroyed!"
      redirect_to cities_path
  end

  private

      def city_params
          params.require(:city).permit(:name, :year_est, :population)
      end

      def city
          @city = City.find(params[:id])
      end
end
