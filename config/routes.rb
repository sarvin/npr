Rails.application.routes.draw do
  root 'channels#index'
  resources :channels, only: [:index, :show]
end
