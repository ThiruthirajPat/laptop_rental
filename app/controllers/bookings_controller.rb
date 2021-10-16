class BookingsController < ApplicationController
  
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    print(@booking)
      if @booking.save
        redirect_to bookings_path, notice: 'booking was created'
      else
        render :new
      end
  end

  def show
  end

  def edit
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private
 
  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date_from, :date_to, :status, :laptop_id )
  end

end
