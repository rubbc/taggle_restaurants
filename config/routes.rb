Rails.application.routes.draw do
  get 'arrondissements/index'
  get 'arrondissements/show'
  resources :restaurants
  resources :arrondissements

  get '/tagged', to: "restaurants#tagged", as: :tagged

  root to: "restaurants#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
