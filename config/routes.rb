Rails.application.routes.draw do
  post '/register', to: 'users#register'
  post '/login', to: 'users#login'
  resources :transactions, only: [:index, :create, :destroy]
end
