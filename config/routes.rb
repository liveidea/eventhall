Rails.application.routes.draw do
mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  # devise_for :users do
  #    get '/users/sign_out' => 'devise/sessions#destroy'
  # end

    devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  mount Attachinary::Engine => "/attachinary"




scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  root  "halls#index"

  resources :halls do
     member do
        post :like
     end
  end

  resources :contacts, only: [:new, :create]

  get 'our_team' => 'halls#team'
end

end
