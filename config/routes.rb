Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end
  post '/posts/:post_id/comments', to: "comments#create"
  get '/posts/:post_id/comments/new', to: "comments#new"
  
  get 'api/users/:user_id', to: 'api#user_posts'
  namespace :api, defaults: { format: :json} do
    post 'users/register', to: 'authentication#register'
    post 'users/login', to: 'authentication#login'
    get 'api/users/:user_id', to: 'api#user_posts'
    get 'comments', to: 'api#list_comments'
    post 'new_comment', to: 'api#create_comment'
  end

  root "users#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
