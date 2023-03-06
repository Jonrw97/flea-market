Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'items', to: 'items#index'
  get 'items/new', to: 'items#new'
  post 'items/:id', to: 'items#create'
end
