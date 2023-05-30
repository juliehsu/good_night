Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'main#index'

  namespace :api do
    namespace :v1 do
      resources :relations
      resources :users
      resources :sleep_records
    end
  end

  match ':controller(/:action(/:id(.:format)))', :via => :all
end