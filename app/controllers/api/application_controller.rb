class Api::ApplicationController < ::ApplicationController
	skip_before_action :verify_authenticity_token

  def current_user
    #return nil unless session[:user_id]
    #User.find(session[:user_id])
    #not implement auth, use config for demo switch current_user

    User.find(::Configuration.find_by_key('session_user_id')&.value) || User.first
  end
end
