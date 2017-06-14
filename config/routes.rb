Rails.application.routes.draw do
	resources :buy_points
	patch "buy_points/index", to: "buy_points#create"
  get 'home/index'
  get 'users/index'
  #get 'buy_points/', to: "buy_points#index"
  #post 'buy_points/index', to: "buy_points#create"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"



end
