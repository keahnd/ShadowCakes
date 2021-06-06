Rails.application.routes.draw do
  resources :reviews
  resources :order_items
  get 'cart', to: 'cart#show'
  get 'search', to: 'menu#search'
  resources :categories
  get 'menu', to: 'menu#index'
  devise_for :users
  resources :reviews
  resources :products
  root 'pages#home'
  get 'info', to: 'pages#info'
  get 'admin', to: 'admin#index'
  get 'user', to: 'users#index'
  resources :orders
  get '/cart/checkout', to: 'orders#new', as: :checkout
  patch '/cart/checkout', to: 'orders#create'
  post 'cart/checkout', to: 'menu#index'
  get :send_order_mail, to: 'cart#send_order_mail', as: :send_order_mail
  get :send_payment_reminder, to: 'order#send_payment_reminder', as: :send_payment_reminder
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
