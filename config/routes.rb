Rails.application.routes.draw do
  devise_for :users
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'  # Overide default show action
  get 'angular-portfolio', to: 'portfolios#angular_items', as: 'portfolio_angular'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'


  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
end
