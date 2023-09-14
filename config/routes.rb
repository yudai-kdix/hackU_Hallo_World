Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/about'
  get 'prints/index' => 'prints#index'
  get 'chats/Chatgptedit' => 'chats#Chatgptedit'
  post 'chats/create' => 'chats#create'
  # get 'chats/create' => 'chats#create'
   
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
