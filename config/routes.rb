Rails.application.routes.draw do
  devise_for :users
  root to: "dashboards#index"
  resources :controls
  resources :misc_reagents
  resources :chem_reagents
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
