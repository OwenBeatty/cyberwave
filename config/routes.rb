Rails.application.routes.draw do
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
end
