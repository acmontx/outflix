Rails.application.routes.draw do
  devise_for :users
  # get  "/contents/filterCategory" => "contents#filterCategory"

  root to: 'pages#home'
  resources :contents do
    collection do
      get 'setup'
    end
  end

end

