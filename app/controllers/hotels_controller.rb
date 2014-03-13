class HotelsController < ApplicationController
  before_action :init_hotel, only: :new
  before_action :set_hotel, only: [:show, :edit]

  def index
    @hotels = Hotel.all
    @hotel_flier = HotelFlier.new
  end

  def show
  end

  def edit
  end

  def create
    @hotel = Hotel.create(hotel_params)
    redirect_to home_path
  end

  def update
    @hotel.update(hotel_params)
    redirect_to home_path
  end

  def destroy
  end
  
  private
  def set_hotel
    @hotel = Hotel[params[:id]]
  end
  
  def init_hotel
    @hotel = Hotel.new
  end
  
  def hotel_params
    params.require(:hotel).permit(:name, :address, :phone, :website)
  end
end
