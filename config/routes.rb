Rails.application.routes.draw do

  resources :tags
  resources :reviews
  resources :rates
  resources :categories
  resources :orders
  resources :dishes
  resources :users
  resources :account_activations, only: [:edit]
  resource :session, only: [:new, :create, :destroy]
  get 'home/index'
  get 'sessions/new'

  get '/signup' => 'users#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get "/users/new/:role", :to => 'users#new'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
