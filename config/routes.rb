Rails.application.routes.draw do
  root to: "customers#show"
  
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
  end
  
  devise_for :customers
  

  resources :customers
  
  # /customers
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
