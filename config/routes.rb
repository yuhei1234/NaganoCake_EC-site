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
  
  scope module: :customers do
    resources :items, only: [:index, :show]
    
    resources :orders do
      collection do
        post :confirm
        get :thanks
      end
    end
    resources :delivers
    resources :order_items
    resources :cart_items do
      collection do
        delete :destroy_all
      end
    end
  end
  
  scope :customers do
    resource :customers, only: [:show, :edit, :update]
  end
  get "/customers/confirm" => "customers#confirm", as: "customers_confirm"
  put "/customers/hide" => "customers#hide", as: "customers_hide"
  
  devise_for :customers
  
  
  
  
  # /customers
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
