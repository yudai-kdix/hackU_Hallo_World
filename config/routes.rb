Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about' => 'homes#top'
  get 'prints/index' => 'prints#index'
  get 'chats/edit' => 'chats#edit'
  post 'chats/create' => 'chats#create'
  get 'chats/index' => 'chats#index'
   
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
