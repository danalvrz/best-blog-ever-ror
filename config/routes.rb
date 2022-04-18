Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end
  post '/posts/:post_id/comments', to: "comments#create"
  get '/posts/:post_id/comments/new', to: "comments#new"
  root "users#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
