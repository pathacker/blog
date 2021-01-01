Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  resource :sessions
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
