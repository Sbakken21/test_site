Rails.application.routes.draw do
    root to: 'pages#home'
    devise_for :users, controllers: { registrations: 'users/registrations' }
    get 'temp', to: 'pages#temp'
    get 'signup', to: 'pages#signup'
    resources :posts do
        resources :comments
    end
    resources :users do
        resource :profile
    end
end
