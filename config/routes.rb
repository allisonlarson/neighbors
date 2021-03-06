Rails.application.routes.draw do
  root "welcome#index"

  resources :neighborhoods, only: [:show] do
    get '/save' => 'neighborhoods#save', as: :save
    get '/forget' => 'neighborhoods#forget', as: :forget
    get '/photos_gallery' => 'neighborhoods#photos', as: :photos_gallery
  end

  resources :cities, only: [:index, :show]
  resources :sessions, only: [:destroy]
  resources :users, only: [:show, :edit, :update] do
    get '/text' => 'users#text', as: :text
  end
  resources :neighborhood_photos, only: [:create]
  resource  :verifications, only: [:create]

  namespace :api do
    namespace :v1 do
      resources :neighborhoods, only: [:index, :show] do
        resources :establishments, only: [:index]
        resources :coordinates, only: [:index]
      end
    end
  end

  get   '/search'           => 'welcome#search', as: :search
  match '/auth/twitter/callback', to: 'sessions#create', via: 'get'

end
