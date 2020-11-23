Rails.application.routes.draw do
  root to: "customers#top"
  
  # managers
  devise_for :managers, controllers: {
    sessions:      'managers/sessions',
    passwords:     'managers/passwords',
    registrations: 'managers/registrations'
  }
  
  resources :managers, only: [:index]
  
  namespace :managers do
    resources :genres, :items, :customers, :orders, :order_items
  end
  # /managers
  
  
  
  # customers
  get "/customers/about" => "customers#about"
  get "/customers/order_item/confilm" => "customers/order_items#confilm"
  get "/customers/order_item/thanks" => "customers/order_items#thanks"
  
  scope module: :customers do
    resources :items, only: [:index, :show]
    resources :orders
    resources :delivers
    resources :order_items
    resources :cart_items
    resources :carts, only: [:show]
    post '/add_item' => 'carts#add_item'
    post '/update_item' => 'carts#update_item'
    delete '/delete_item' => 'carts#delete_item'
  end
  
  scope :customers do
    resource :customers, only: [:show, :edit, :update]
  end
  get "/customers/confirm" => "customers#confirm", as: "customers_confirm"
  put "/customers/confirm" => "customers#hide", as: "customers_hide"
  
  devise_for :customers
  
  
  
  
  # /customers
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
