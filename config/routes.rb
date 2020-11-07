Rails.application.routes.draw do
  root "managers/orders#index"
  
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
  devise_for :customers
  
  scope module: :customers do
    resources :items, only: [:index, :show]
    resources :orders
  end
  # /customers
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
