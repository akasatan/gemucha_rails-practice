Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'homes#top'
  get '/posto/hashtag/:name' => 'postos#hashtag'
  #get 'posto/hashtag' => 'posto#hashtag'
  resources :postos
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
  resources :users do
      member do
        get :following, :followers
      end
    end
  resources :relationships, only: [:create, :destroy]
end
