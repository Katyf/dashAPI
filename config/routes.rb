Rails.application.routes.draw do
  resources :links, except: [:new, :edit]
  resources :notes, except: [:new, :edit]
  resources :settings, except: [:new, :edit]

  resources :users, except: [:new, :edit]
  post '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
end
