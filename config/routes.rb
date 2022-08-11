Rails.application.routes.draw do
  root 'pages#index'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  resources 'users', except: [:new]

#This is provide us with the all REST-full routes 
  resources 'articles'
end
