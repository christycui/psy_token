Rails.application.routes.draw do
  root to: 'pages#front'
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  get '/logout', to: "sessions#destroy"
  get '/home', to: "users#balance"
  get '/redeem', to: "users#redeem"
  patch '/redeemed', to: "users#redeemed"

  resources :users, only: [:create]
  resources :sessions, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
