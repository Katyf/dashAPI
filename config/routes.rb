Rails.application.routes.draw do
  resources :links, except: [:new, :edit]
  resources :notes, except: [:new, :edit]
  resources :settings, except: [:new, :edit]

  resources :users, defaults: {format: :json}, only: [:show, :index, :create] do
    post 'sign_in', on: :collection
  end

end
