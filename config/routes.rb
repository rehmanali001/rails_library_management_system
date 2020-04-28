Rails.application.routes.draw do
  root :to => 'sessions#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  
  resources :genres
  resources :comments
  resources :users do 
    resources :books, only: [:new, :create, :index]
  end 
  resources :books do
    resources :comments, only: [:new, :create, :index]
  end 


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
