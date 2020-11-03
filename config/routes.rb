Rails.application.routes.draw do
  devise_for :managers, controllers: {
    sessions:      'managers/sessions',
    passwords:     'managers/passwords',
    registrations: 'managers/registrations'
  }
  
  devise_for :customers
  
  root "managers#index"
  
  resources :managers
  
  namespace :managers do
    resources :genres, :items, :orders, :order_items
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
