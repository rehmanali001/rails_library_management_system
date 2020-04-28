Rails.application.routes.draw do
  root :to => 'sessions#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  
  resources :genres, only: [:index, :show]
  resources :comments
  resources :users do 
    resources :books, shallow: true
  end 
  resources :books do
    resources :comments
  end 


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
