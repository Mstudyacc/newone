Rails.application.routes.draw do
  root 'pages#index'
  get 'about', to: 'pages#about'

#This is provide us with the all REST-full routes 
  resources 'articles'
end
