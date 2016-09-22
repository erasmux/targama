Rails.application.routes.draw do
  resources :dialects, :only => [:index, :create, :update, :show, :destroy]
  resources :gram_forms, :only => [:index, :create, :update, :show, :destroy]
end
