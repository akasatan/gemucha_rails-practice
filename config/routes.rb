Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'post/hashtag/:name' => 'post#hashtag'
  #get 'post/hashtag' => 'post#hashtag'
  resources :posts
end
