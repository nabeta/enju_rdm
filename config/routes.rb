Rails.application.routes.draw do
  resources :reviews
  resources :collections
  resources :doi_records
  get 'page/home'
  resources :filesets
  resources :datasets
  resources :profiles
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'page#home'
end
