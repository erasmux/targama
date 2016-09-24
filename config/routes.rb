Rails.application.routes.draw do
  get 'home/index'

  resources :dialects, :only => [:index, :create, :update, :show, :destroy]
  resources :gram_forms, :only => [:index, :create, :update, :show, :destroy]
  resources :twords

  root 'home#index'
end
