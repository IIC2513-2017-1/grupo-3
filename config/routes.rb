Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  resources :tags
  resources :reviews
  resources :rates
  resources :categories
  resources :dishes
  resources :users
  resources :account_activations, only: [:edit]
  resource :session, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]

  get 'home/index'
  get 'sessions/new'
  post '/cart_items' => 'cart_items#create'
  get '/cart' => 'cart_items#index'
  delete '/cart' => 'cart#destroy'
  delete '/cart_items' => 'cart_items#destroy'

  get '/signup' => 'users#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get "/users/new/:role", :to => 'users#new'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
