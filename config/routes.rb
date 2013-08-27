BackboneAuth::Application.routes.draw do
  root to: 'welcome#index'

  devise_for :users
  get :protected, to: 'welcome#protected'

  namespace :api, defaults: { format: :json } do
    resource :session, only: [:show, :create, :destroy]
    resources :articles
  end
end
