Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'  # Overide default show action

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  resources :blogs

  # root 'pages#home' // this works as well
  root to: 'pages#home'
end
