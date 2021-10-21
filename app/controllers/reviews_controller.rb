class ReviewsController < ApplicationController
    before_action :set_booking, only: [:new, :create]
    before_action :set_review, only: [:destroy]

    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.booking = @booking
        @laptop = @booking.laptop
        if @review.save
            redirect_to laptop_path(@laptop), notice: 'Your review was created' 
        else
            render :new
        end
    end

    def destroy
        @review.destroy
        redirect_to laptops_path(@booking), notice: 'Review was deleted' 
    end

private

    def review_params
        params.require(:review).permit(:rating, :content, :booking_id)
    end

    def set_booking
        @booking = Booking.find(params[:booking_id])
    end

    def set_review
        @review = Review.find(params[:id])
    end
  
end
