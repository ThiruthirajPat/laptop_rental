class LaptopsController < ApplicationController
 before_action :set_laptop, only: [:show, :edit, :update, :destroy]

    def index
      @laptops = Laptop.all
    end

    def show
      # @review = Review.new
    end

    def new
      @laptop = Laptop.new
    end

    def edit
    end

    def update
    end

    def destroy
      @laptop.destroy
      redirect_to laptops_path
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
