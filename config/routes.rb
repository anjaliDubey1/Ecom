Rails.application.routes.draw do
  get 'order/index'
  get 'cart/index'
  get 'customers/index'
  devise_for :users
  root 'details#index'
  resources :sellers
  resources :customers
  resources :carts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
