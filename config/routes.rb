Rails.application.routes.draw do
  root "welcome#index"

  resources :neighborhoods, only: [:index, :show]
    get '/:id/save' => 'neighborhoods#save', as: :save_neighborhood
    get '/:id/forget' => 'neighborhoods#forget', as: :forget_neighborhood
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


  get   '/search'           => 'welcome#search', as: :search
  match '/auth/twitter/callback', to: 'sessions#create', via: 'get'

end
