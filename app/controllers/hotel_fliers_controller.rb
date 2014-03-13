class HotelFliersController < ApplicationController
  before_action :set_hotel
  before_action :init_flier, only: :new
  before_action :set_flier, only: [:show, :edit, :update]

  def index
  end

  def show
    send_data @hotel_flier.flier_pdf, type: 'application/pdf', disposition: :inline
  end

  def edit
  end

  def new
  end

  def create
    @hotel_flier = HotelFlier.new({day: Date.today,
                                   message: fortune}.merge(flier_params))
    @hotel_flier.hotel = @hotel
    if @hotel_flier.save
      @hotel_flier.enqueue
    end
    redirect_to home_path
  end

  def update
    @hotel_flier.update({message: fortune}.merge(flier_params))
    @hotel_flier.enqueue
    redirect_to home_path
  end

  def destroy
  end

  private
  def set_hotel
    @hotel = Hotel[params[:hotel_id]]
  end

  def set_flier
    @hotel_flier = HotelFlier[params[:id]]
  end
  
  def init_flier
    @hotel_flier = @hotel.current_flier || HotelFlier.new
  end
  
  def flier_params
    params.require(:hotel_flier).permit(:day, :message)
  end

  private
  def fortune
    message = LinuxFortune.fortune
    message.gsub(/[\r\n]/, ' ')
  end
end
