Rails.application.routes.draw do
  get 'plans/reserve/confirm/reserve/create/:id', to:'reserve#create'
  get 'plans/reserve/confirm/:id', to:'reserve#confirm'
  get 'search/result'
  get 'plans/new'
  root 'home#top'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  resources :users
  resources :companies
  resources :plans
  resources :reserve
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
