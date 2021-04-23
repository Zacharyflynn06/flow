Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#landing_page'

  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  
  resources :users do
    resources :courses, only: [:index]
  end
  
  resources :courses do
    resources :reviews, only: [:new]
  end

  resources :reviews
  
  get 'auth/:provider/callback' => 'sessions#omniauth'
end
