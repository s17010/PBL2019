Rails.application.routes.draw do
  #resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/posts/index' => 'posts#index'
  get '/posts/new' => 'posts#new'
  get '/posts/:id/edit' => 'posts#edit'
  get '/posts/:id' => 'posts#show'

  delete '/posts/:id' => 'posts#destroy'
  post '/posts' => 'posts#create'
  
  
  get '/catalog', to: 'posts#catalog'
  patch '/posts/:id' => 'posts#update'
  put '/posts/:id' => 'posts#update'
  post "/posts/:id/edit" => "posts#update"
  
  get "/login" => "posts#login_form"
  post "/login" => "posts#login"
  
  
  post "/logout" => "posts#logout"
  post '/' => 'posts#catalog'
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  root to: 'posts#catalog'
end
