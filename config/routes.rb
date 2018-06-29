Rails.application.routes.draw do
  get 'hashtags/show/:name', to: 'hashtags#show'

  root 'users#index'

  resources :users
  resources :questions, except: [:show, :new, :index]
  resource :session, only: [:new, :create, :destroy]
end
