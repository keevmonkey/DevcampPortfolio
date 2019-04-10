Rails.application.routes.draw do
  get 'pages/about'
  get 'pages/contacts'
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'
end
