Rails.application.routes.draw do

  resources :tags
  resources :reviews
  resources :rates
  resources :categories
  resources :dishes
  resources :users
  resource  :session, only: [:new, :create, :destroy]
  # resource  :cart, only: [:show]

  get 'home/index'
  get 'sessions/new'
  post '/cart_items' => 'cart_items#create'
  get '/cart' => 'cart_items#index'

  get '/signup' => 'users#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get "/users/new/:role", :to => 'users#new'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
