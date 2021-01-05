Rails.application.routes.draw do
  get 'search/result'
  get 'plans/new'
  root 'home#top'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  get '/logout', to:'sessions#destroy'
  get '/about', to:'home#about'
  get '/contact', to:'home#contact'
  get '/coin', to:'home#coin'
  resources :users
  resources :companies
  resources :plans
  resources :reserve do
    member do
      get :confirm
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
