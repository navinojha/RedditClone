Rails.application.routes.draw do
  devise_for :accounts
  get "u/:username", to: "public#profile", as: :profile
  get "search", to: "posts#search"

  resources :communities do
    resources :posts
  end
  
  resources :subscriptions
  resources :comments, only: [:create]

  post "post/vote" => "votes#create"

  root to: "public#index"
end
