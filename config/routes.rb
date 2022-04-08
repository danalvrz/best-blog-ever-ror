Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end
  root "users#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
