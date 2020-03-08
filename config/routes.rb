Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :contents do
    # collection do
    #   get 'setup'
    # end
  end

end

