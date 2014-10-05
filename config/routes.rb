Rails.application.routes.draw do
  root 'home#welcome'
  get '/about', to: 'home#about'

  resources :items
end
