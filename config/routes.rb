Rails.application.routes.draw do
  root 'cities#index'

  resources :cities do
    resources :restaurants
  end
end
