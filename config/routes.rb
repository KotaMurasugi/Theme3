Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#top"
  resources :books
  resources :users, only: [:show, :index, :edit, :update]
  get '/home/about', to: 'home#about'
end
