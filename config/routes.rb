Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'items', to: 'items#index'
  get 'receipts', to: 'receipts#index'
  get 'items/new', to: 'items#new'
  get 'receipts/:id', to: 'receipts#show', as: 'receipt'
  get 'items/:id', to: 'items#show', as: 'item'
  get "items/:id/edit", to: "items#edit", as: 'edit_item'
  patch "items/:id", to: "items#update"
  post 'items', to: 'items#create'
  post 'items/:id/receipts', to: 'receipts#create', as: 'new_receipts'
end
