Rails.application.routes.draw do
  resources :reviews
  resources :rates
  resources :categories
  resources :orders
  resources :dishes
  resources :users
  get 'home/index'
  root 'home#index'

  resources :cooks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
