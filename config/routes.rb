Rails.application.routes.draw do

  #   resources :products
  resource :session, only: [:create, :destroy, :new]
  resources :users, only: [:create, :new, :show]
  resources :bands, :albums, :tracks
end
