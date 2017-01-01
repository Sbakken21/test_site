Rails.application.routes.draw do
    root to: 'pages#home'
    get 'comments', to: 'pages#comments', as: 'comments'
end
