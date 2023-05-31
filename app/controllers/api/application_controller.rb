class Api::ApplicationController < ::ApplicationController
	skip_before_action :verify_authenticity_token

  def current_user
    return nil unless session[:user_id]
    User.find(session[:user_id])
  end
end
