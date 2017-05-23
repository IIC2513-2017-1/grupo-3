Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  resources :tags
  resources :reviews
  resources :rates

  resources :dishes, swallow: true do
    resources :reviews
    resources :rates
    resources :tags
    resources :pictures, only: [:index]
  end

  resources :categories do
    resources :dishes, only: [:index, :show]
  end

  resources :users, swallow: true do
    resources :dishes, controller: 'users/dishes'
    resources :carts, only: [:show]
  end
  # resources :carts, only: [:destroy]
  resources :account_activations, only: [:edit]
  resource :session, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]

  get 'home/index'
  get 'sessions/new'
  post '/cart_items' => 'cart_items#create'
  get '/cart' => 'cart_items#index'
  delete '/cart' => 'carts#destroy'
  delete '/cart_items' => 'cart_items#destroy'

  get 'users/:id/dishes' => 'dishes#index', :as => :user_dishes_path

  get '/signup' => 'users#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get "/users/new/:role", :to => 'users#new'

  root 'home#index'

  get 'tags/:tag', to: 'dishes#index', :constraints  => { :tag => /[^\/]+/ }

  get '/admin_help' => 'static_pages#admin_help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
