Rails.application.routes.draw do
  resources :feeds, except: [:new, :edit]
  resources :quotes, except: [:new, :edit]
  # resources :links, except: [:new, :edit]
  # resources :notes, except: [:new, :edit]
  # resources :settings, except: [:new, :edit]

  resources :users, except: [:new, :edit] do
    resources :links, except: [:new, :edit]
    resources :notes, except: [:new, :edit]
    resources :settings, except: [:new, :edit]
  end

  post '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
end
