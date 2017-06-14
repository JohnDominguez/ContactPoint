Rails.application.routes.draw do
root to: "home#index"
#Courses routes
  get 'courses', to: "course#home"
  get 'course/:id', to:"course#show"
  get 'courses/new', to: "course#new", as: 'new_course'
  get 'cart/showdos/:otherid', to: "cart#showdos"
  
  post '/courses', to: 'course#create'
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
