Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  resources :tags
  resources :reviews

  resources :dishes, swallow: true do
    resources :reviews
    resources :tags
    resources :pictures, only: [:index]
    member do
      get :add_to_cart
    end
  end

  resources :orders, only: [:show, :index] do
    member do
      get  :checkout, as: "checkout"
      post :place_order
    end
  end

  get "orders/order_completed/:id" => "orders#completed", as: "completed_order"

  resources :categories do
    resources :dishes, only: [:index, :show]
  end

  resources :carts do
    member do
      get :remove
      get :delete
    end
  end

  resources :bank_accounts, only: [:show, :edit, :destroy]

  resources :users, swallow: true do
    resources :dishes, controller: 'users/dishes'
    resources :carts
    resources :orders, except: [:delete, :update]
    resources :bank_accounts
  end
  # resources :carts, only: [:destroy]
  resources :account_activations, only: [:edit]
  resource :session, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]

  get 'home/index'
  get 'sessions/new'
  # post '/cart_items' => 'cart_items#create'
  # get '/user/:id/cart' => 'carts#show', :as => :cart_path
  # delete '/cart' => 'carts#destroy'
  # delete '/cart_items' => 'cart_items#destroy'

  get 'users/:id/dishes' => 'dishes#index', :as => :user_dishes_path

  # get 'dishes/:id/reviews/new' => 'reviews#new', :as => :new_dish_review_path

  get '/signup' => 'users#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get "/users/new/:role", :to => 'users#new'

  root 'home#index'

  get 'tags/:tag', to: 'dishes#index', :constraints  => { :tag => /[^\/]+/ }

  get '/admin_help' => 'static_pages#admin_help'
  get '/shopping_history' => 'static_pages#shopping_history'
  get '/promotions' => 'static_pages#promotions'
  get '/app_info' => 'static_pages#app_info'
  get '/popular_cooks' => 'static_pages#popular_cooks'
  get '/popular_dishes' => 'static_pages#popular_dishes'
  get '/statistics' => 'static_pages#statistics'

  resources :favorite_dishes, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
