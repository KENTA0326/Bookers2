Rails.application.routes.draw do
  get 'searches/search'
  devise_for :users
  get 'homes/top'
  get 'home/about' => 'homes#about', as: 'about'
  get 'comment/new'
  #中略

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'


  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :comments
  end

  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
  resources :users, only: [:edit, :show, :update, :index] do
    member do
      get :follows, :followers
    end
      resource :relationships, only: [:create, :destroy]


   end
   end
