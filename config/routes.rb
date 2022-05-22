Rails.application.routes.draw do
  resources :rooms, only: [:index, :new, :create, :show]
  resources :reservations, only: [:index, :new, :create, :show]
  resources :tops, only: [:index]

  get 'search/rooms', to: 'rooms#search', as: 'rooms_search'

  root 'tops#index'


  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :confirmations => 'users/confirmations'
  }

  devise_scope :user do
    get 'users/:id/top', to: 'users/sessions#show_mypage', as: 'mytop'
    get 'users/:id/menu', to: 'users/sessions#show_mymenu', as: 'mymenu'
    get 'users/:id/profile', to: 'users/sessions#show_myprofile', as: 'myprofile'
    patch 'users/:id/profile', to: 'users/sessions#update_myprofile', as: 'up_myprofile' 
    get 'users/:id/account', to: 'users/sessions#show_myaccount', as: 'myaccount'
    get 'users/:id/account/edit', to: 'users/sessions#edit_myaccount', as: 'ed_myaccount'
    patch 'users/:id/account/', to: 'users/sessions#update_myaccount', as: 'up_myaccount'
    get '/users/sign_in', to: 'users/sessions#new', as: 'login_form'
    post '/users/sign_in', to: 'users/sessions#create', as: 'login'
    get "/users/sign_up", :to => 'users/registrations#new', as: 'signup'
    get "/users/sign_out", :to => 'users/sessions#destroy', as: 'logout'
  end
end
