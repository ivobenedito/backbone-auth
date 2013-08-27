BackboneAuth::Application.routes.draw do
  root to: 'welcome#index'
  devise_for :users

  namespace :api, defaults: { format: :json } do
    resource :session, only: [:show, :create, :destroy]
    resources :articles
  end
end
