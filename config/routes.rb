Rails.application.routes.draw do


  root 'users#index'

  get 'hashtags/show/:name', to: 'hashtags#show'
  get "/users/hashtags/show", to: 'hashtags#show'
  resources :users
  resources :questions, except: [:show, :new, :index]
  resource :session, only: [:new, :create, :destroy]
end
