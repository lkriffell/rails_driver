Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/items', to: 'items#index'
  root to: 'welcome#index'

  namespace :admin do
    get '/', to: 'dashboard#show'
    namespace :merchants do
      post '/search', to: 'search#index'
    end
    resources :merchants, only: [:show, :edit]
  end

  resources :items, only: [:index, :show]
  resources :merchants, only: [:index, :show, :new]
end
