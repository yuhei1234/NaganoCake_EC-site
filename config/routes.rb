Rails.application.routes.draw do
  root to: "customers/items#index"
  
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
  
  scope module: :customers do
    resources :items, only: [:index, :show]
    resources :orders
  end
  
  devise_for :customers
  
  # /customers
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
