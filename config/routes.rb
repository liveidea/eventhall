Rails.application.routes.draw do

  devise_for :users



  root  "halls#index"

  resources :halls


end
