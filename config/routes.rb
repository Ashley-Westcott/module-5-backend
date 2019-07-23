Rails.application.routes.draw do
  resources :details
  resources :trips
  resources :travelers
      post '/login', to: 'auth#login'
      get "/auto_login", to: 'auth#auto_login'
      get '/signup', to: 'travelers#new'
      post '/signup', to: 'travelers#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
