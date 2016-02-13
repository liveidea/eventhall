Rails.application.routes.draw do

  resources :controllers
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

 # root  "home#index"


end
