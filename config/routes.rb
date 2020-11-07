Rails.application.routes.draw do
  root "managers/items#show"
  
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
  end
  # /customers
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
