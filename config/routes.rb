Rails.application.routes.draw do
  resources :orders
  devise_for :users
  resources :provinces
  resources :pages
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :categories
  resources :products

  root to: "products#index"

  get "/p/:permalink", to: "pages#permalink", as: "permalink"

  get "search", to: "products#search", as: "search"

  get "cart", to: "products#cart", as: "cart"

  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"
end
