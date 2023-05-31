Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'main#index'

  namespace "api" do
  	namespace "v1" do
	  post '/clock_in', to: 'sleep_records#clock_in'
	  get '/my_records', to: 'sleep_records#index'
	  get '/records_im_following', to: 'sleep_records#following_records_during_last_week'

	  post '/users/:id/follow', to: 'users#follow'
	  post '/users/:id/unfollow', to: 'users#unfollow'
  	end
  end

  match ':controller(/:action(/:id(.:format)))', :via => :all
end
