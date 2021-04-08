Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#landing_page'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :users do
    resources :klasses, as: :classes, path: :classes, only: [:show, :index]
  end
  resources :klasses, as: :classes, path: :classes


end
