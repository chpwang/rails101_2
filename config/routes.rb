Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "groups#index"

  resources :groups do
    resources :posts

    member do
      post :join
      post :quit
    end
  end

  namespace :account do
    resources :groups
    resources :posts
  end
end
