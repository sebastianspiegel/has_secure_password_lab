Rails.application.routes.draw do
  resources :users
  resources :sessions
  get '/homepage', to: 'users#homepage'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
