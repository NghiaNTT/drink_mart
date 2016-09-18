Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  get "home" => "static_pages#home"
  get "help" => "static_pages#help"
  get "about"   => "static_pages#about"
  get "contact" => "static_pages#contact"
  get "/cart" =>"cart#index"
  delete "/cart/:id/delete" => "cart#destroy"
  get "/cart/:id" =>"cart#create"
  post "/cart/:id" => "cart#update"

  resources :products
  resources :categories
  resources :reviews
  resources :users
  resources :cart

  namespace :admin do
    resources :products
    resources :categories
    resources :users
  end
end
