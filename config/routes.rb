Rails.application.routes.draw do
  get 'chats/show'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'search' => 'searches#search'
  get 'chat/:id', to: 'chats#show', as: 'chat'
  resources :chats, only: [:create]
  resources :users,only: [:show,:index,:edit,:update] do
     resources :relationships, only: [:create, :destroy]
     get 'follow' => 'relationships#follow'
     get 'follower' => 'relationships#follower'
  end
  resources :books do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end
end