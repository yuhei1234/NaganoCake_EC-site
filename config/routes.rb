Rails.application.routes.draw do
  root "genres#index"
  
  devise_for :managers, controllers: {
    sessions:      'managers/sessions',
    passwords:     'managers/passwords',
    registrations: 'managers/registrations'
  }
  
  devise_for :customers
  
  resources :managers
  resources :genres
  
  namespace :managers do
    resources :items, :orders, :order_items
  end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
