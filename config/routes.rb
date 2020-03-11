Rails.application.routes.draw do
  devise_for :users

  as :user do
    get 'users/profile', to: 'contents#index', as: :user_root
  end

  resources :notifications, only: [:index, :edit, :update]

  root to: 'pages#home'

  resources :contents do
    # collection do
    #   get 'setup'
    # end
  end
end
