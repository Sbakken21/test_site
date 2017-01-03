Rails.application.routes.draw do
    root to: 'pages#home'
    devise_for :users, controllers: { registrations: 'users/registrations' }
    get 'temp', to: 'pages#temp'
    resources :posts do
        resources :comments
    end
end
