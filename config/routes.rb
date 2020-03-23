Rails.application.routes.draw do
  root 'users#top'
  devise_for :users
  resources :users
  resources :books do
  	resource :book_comments, only: [:create,:destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  resource :favorites, only: [:create, :destroy]
  get 'home/about' => 'users#about', as:'about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end