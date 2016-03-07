Rails.application.routes.draw do

  devise_for :users do
     get '/users/sign_out' => 'devise/sessions#destroy'
  end

  mount Attachinary::Engine => "/attachinary"


  root  "halls#index"

  resources :halls do
     member do
        put :checked
     end
  end

  get 'our_team' => 'halls#team'


end
