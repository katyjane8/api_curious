Rails.application.routes.draw do
  root to: 'home#index'
  get '/auth/github', as: :login
  get 'auth/:provider/callback',  to: 'sessions#create'

  get 'dashboard', to: 'dashboard#show'
end
