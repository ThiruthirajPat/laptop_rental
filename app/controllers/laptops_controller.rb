class LaptopsController < ApplicationController
 before_action :set_laptop, only: [:show, :edit, :update, :destroy]

    def index
      if params[:query].present?
        sql_query = " \
          laptops.brand @@ :query \
          OR laptops.model @@ :query \
          OR laptops.operating_system @@ :query \
          OR laptops.collection_point @@ :query \
        "
        @laptops = Laptop.where(sql_query, query: "%#{params[:query]}%")
      else
        @laptops = Laptop.all
      end
    end

    def show
      @booking = Booking.new
    end

    def new
      @laptop = Laptop.new
    end

    def edit
    end

    def update
      if @laptop.update(laptop_params)
        redirect_to @laptop, notice: 'Laptop was updated'
      else
        render :edit
      end
    end

    def destroy
      @laptop.destroy
      redirect_to current_user, notice: 'Laptop was deleted'
    end

    def create
      @laptop = Laptop.new(laptop_params)
      @laptop.user = current_user
        if @laptop.save
          redirect_to laptops_path, notice: 'laptop was created'
        else
          render :new
        end
    end

    private

    def set_laptop
      @laptop = Laptop.find(params[:id])
    end

    def laptop_params
      params.require(:laptop).permit(:brand, :model, :operating_system, :date_manufacture, :collection_point, :rental_rate, :photo )
    end
end
