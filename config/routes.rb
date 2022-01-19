Rails.application.routes.draw do
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:user_id/posts', to: 'posts#index'
  get '/users/:user_id/posts/new', to: 'posts#new', as: 'posts_form'
  get '/users/:user_id/posts/create', to: 'posts#create'
  post '/users/:user_id/posts/create', to: 'posts#create', as: 'posts_create'
  get '/users/:user_id/posts/:id/comments/create', to: 'comments#create'
  post '/users/:user_id/posts/:id/comments/create', to: 'comments#create', as: 'comments_create'
  get '/users/:user_id/posts/:id/likes/create', to: 'likes#create'
  post '/users/:user_id/posts/:id/likes/create', to: 'likes#create', as: 'likes_create'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'post_details'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
end
