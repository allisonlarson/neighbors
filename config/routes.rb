Rails.application.routes.draw do
  root "welcome#index"

  resources :neighborhoods, only: [:index, :show]
  resources :cities, only: [:index, :show]
  resources :sessions, only: [:destroy]
  resources :users, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :neighborhoods do
        resources :establishments
      end
    end
  end

  get     '/search'           => 'welcome#search', as: :search
  match '/auth/twitter/callback', to: 'sessions#create', via: 'get'

end
