Rails.application.routes.draw do

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

get '*path', to: redirect("/#{I18n.default_locale}/%{path}")
get '', to: redirect("/#{I18n.default_locale}")

end
