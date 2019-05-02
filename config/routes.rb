Rails.application.routes.draw do
  resources :portfolios
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  resources :blogs

  # root 'pages#home' // this works as well
  root to: 'pages#home'
end
