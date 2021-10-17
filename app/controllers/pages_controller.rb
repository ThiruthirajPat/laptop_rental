class PagesController < ApplicationController
  def home
    @laptops = Laptop.all
  end
end
