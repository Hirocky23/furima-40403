Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :items do
    resources :purchases, only: [:new, :create]
  end
  # Defines the root path route ("/")
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end
