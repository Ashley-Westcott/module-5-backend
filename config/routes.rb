Rails.application.routes.draw do
  resources :details
  resources :trips
  resources :travelers
      post '/login', to: 'auth#create'
      get '/profile', to: 'travelers#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
