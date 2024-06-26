Rails.application.routes.draw do
  root to: 'item#index'
  devise_for :members, :controllers => { registrations: 'member/registrations' }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/cart', to: 'cart#show'
  get '/order', to: 'order#show'
  get '/orders', to: 'order#index'
  post 'cart/add'
  post 'cart/remove'
  post 'checkout/create', to: 'checkout#create'
  get '/', to: 'item#index'
  get '/search', to: 'item#search'
  get '/item_types', to: 'item_types#index'
  post 'item/add_to_cart/:id', to: 'item#add_to_cart', as: 'add_to_cart'
  delete 'item/remove_from_cart/:id', to: 'item#remove_from_cart', as: 'remove_from_cart'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :item
  resources :item_types
  resources :game_type
  resources :rarity
  resources :checkout, only: [:create]
  resources :webhooks, only: [:create]

  # Defines the root path route ("/")
  # root "posts#index"
end
