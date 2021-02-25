Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'homes#top'
  get '/posto/hashtag/:name' => 'postos#hashtag'
  #get 'posto/hashtag' => 'posto#hashtag'
  resources :postos
  resources :users
  post 'follow/:id' => 'relationships#follow', as: 'follow' 
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' 
end
