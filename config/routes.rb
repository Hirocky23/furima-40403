Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root to: 'items#index'
  resources :items do
<<<<<<< Updated upstream
    resources :purchases, only: [:new, :create]
=======
    resources :card, only: [:show, :index, :create, :update, :destroy]
    resources :purchases, only: [:index, :new, :create]
    resources :orders, only: [:index, :create]
>>>>>>> Stashed changes
  end
end
