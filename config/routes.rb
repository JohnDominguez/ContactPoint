Rails.application.routes.draw do
  resources :carts
  devise_for :admins
  resources :courses
	resources :buy_points
  get 'home/index'
  get 'users/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"



end
