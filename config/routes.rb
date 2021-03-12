Rails.application.routes.draw do
  get 'home/index'
  devise_for :users #, controllers: { sessions: 'users/sessions' }
  resources :tweets
  root 'home#index'
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :followships, only: [:create, :destroy]
  # get 'users/followers'
end
