Rails.application.routes.draw do

  resources :reviews
  resources :rates
  resources :categories
  resources :orders
  resources :dishes
  resources :users
  resource :session, only: [:new, :create, :destroy]
  get 'home/index'
  get 'sessions/new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get '/signup' => 'users#new'

  root 'home#index'

  resources :cooks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
