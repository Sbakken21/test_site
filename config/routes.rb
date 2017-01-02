Rails.application.routes.draw do
  devise_for :users
    root to: 'pages#home'
    get 'temp', to: 'pages#temp'
    resources :posts do
        resources :comments
    end
end
