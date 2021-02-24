Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/posto/hashtag/:name' => 'postos#hashtag'
  #get 'posto/hashtag' => 'posto#hashtag'
  resources :postos
end
