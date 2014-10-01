Rails.application.routes.draw do
  root "welcome#index"

  resources :neighborhoods, only: [:index, :show]
  resources :cities, only: [:index, :show]

  get     '/search'           => 'welcome#search', as: :search
end
