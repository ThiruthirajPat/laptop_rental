Rails.application.routes.draw do

#   get 'laptops/index'
#   get 'laptops/show'
  get 'pages/home'
  get 'bookings/index'
  # get 'bookings/new'
  # get 'bookings/create'
  # get 'bookings/show'
  # get 'bookings/edit'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, :only => [:show]
  resources :laptops do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :new, :create,  :edit, :update] do
    resources :reviews, only: [:new, :create]
  end

  resources :bookings, only: [:destroy]
  resources :reviews, only: [:destroy]

end
