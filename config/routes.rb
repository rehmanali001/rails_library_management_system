Rails.application.routes.draw do
  resources :genres
  resources :comments
  resources :users
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
