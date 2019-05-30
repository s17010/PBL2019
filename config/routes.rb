Rails.application.routes.draw do
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/catalog', to: 'posts#catalog'
  post "/posts/:id/edit" => "posts#update"
  
  get "/login" => "posts#login_form"
  post "/login" => "posts#login"
  
  
  post "/logout" => "posts#logout"
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  root to: 'posts#catalog'
end
