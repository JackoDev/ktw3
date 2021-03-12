Rails.application.routes.draw do
  get 'home/index'
  devise_for :users #, controllers: { sessions: 'users/sessions' }
  resources :tweets
  root 'home#index'
  resources :users
  # get 'users/followers'
end
