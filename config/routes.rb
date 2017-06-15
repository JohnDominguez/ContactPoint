Rails.application.routes.draw do
  resources :suppliers
  resources :products
root to: "home#index"
# Courses routes
# delete 'course/:id', to: "course#destruir"
  get 'courses', to: "course#home"
  post 'courses', to: 'course#create'
  get 'course/:id', to:"course#show"
  get 'course/:id/edit', to: "course#edit"
  patch 'course/:id/edit', to: "course#update"
  get 'courses/new', to: "course#new", as: 'new_course'
  
  
#####
#USuarios routes through devise gem
  devise_for :users
  get 'users/index'
#####
#Cart routes
#get 'cart'
  resources :cart
  #get 'cart/:id', to: "cart#show"
####
  get 'sold_courses/index'


  get 'home/index'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  



end
