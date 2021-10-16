Rails.application.routes.draw do
  get 'laptops/index'
  get 'laptops/show'
  devise_for :users
  root to: 'laptops#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :laptops do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :edit, :update] do
    resources :reviews, only: [:new, :create]
  end

  resources :bookings, only: [:destroy]
  resources :reviews, only: [:destroy]

end
