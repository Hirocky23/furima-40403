Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #end
  # Defines the root path route ("/")
  root to: 'items#index'
  resources :items do
    resources :purchases, only: [:new, :create]
  end
end
