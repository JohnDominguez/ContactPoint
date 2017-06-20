Rails.application.routes.draw do
  resources :purchases
  resources :carts
  resources :courses
	resources :buy_points
	post 'buy_points/buy', to: "buy_points#update"
  get 'home/index'
  get 'users/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"



end
