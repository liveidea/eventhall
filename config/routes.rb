Rails.application.routes.draw do
mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  devise_for :users do
     get '/users/sign_out' => 'devise/sessions#destroy'
  end

  mount Attachinary::Engine => "/attachinary"




scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  root  "halls#index"

  resources :halls do
     member do
        put :checked
     end
  end

  get 'our_team' => 'halls#team'
end


end
