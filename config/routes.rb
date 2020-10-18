Rails.application.routes.draw do
  get 'plans/new'
  root 'home#top'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  resources :users
  resources :companies
  resources :plans
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
