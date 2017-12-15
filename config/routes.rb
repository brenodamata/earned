Rails.application.routes.draw do
  resources :weeklogs
  resources :incentives
  resources :daylogs
  resources :rules
  resources :demerits
  resources :metrics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
