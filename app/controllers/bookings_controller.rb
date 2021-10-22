class BookingsController < ApplicationController
  
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @laptop = Laptop.find(params[:laptop_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @laptop = Laptop.find(params[:laptop_id])
  
    @booking.laptop = @laptop
    @booking.user = current_user 

      if @booking.save
        redirect_to bookings_index_path, notice: 'Booking was created'
      else
        render :new
      end
  end

  def show
    @booking.user = current_user
    @review = Review.new
    @laptop = @booking.laptop
  end
  
  def edit
  end


  def update
    if @booking.update(booking_params)
      redirect_to bookings_index_path, notice: 'Booking was updated'
    else
      render :edit
    end
  end

  def destroy
    @booking.user = current_user 
    @booking.destroy
    redirect_to current_user
  end

  def accept
    @booking = Booking.find params[:id]
    @booking.status = "Approved"
    @booking.save
    redirect_to current_user, notice: 'Booking was Approved'
    # then render something
  end
  
  def reject
    @booking = Booking.find params[:id]
    @booking.status = "Declined"
    @booking.save
    redirect_to current_user, notice: 'Booking was Declined'
    # then render something
  end
  
  private
 
  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date_from, :date_to, :laptop_id )
  end

end
