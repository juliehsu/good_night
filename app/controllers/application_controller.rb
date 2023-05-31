# frozen_string_literal: true

class ApplicationController < ActionController::Base
	if Rails.env.development?
	 after_action do
	   headers['Access-Control-Allow-Origin'] = '*' if request.format.json?
	 end
	end

	def set_cors_headers
	 return false if request.headers['Origin'].blank?

	 begin
	   request_host = URI(request.headers['Origin']).host
	 rescue URI::InvalidURIError
	   return false
	 end

	 # Cope with both "host" and "//host"
	 asset_host = Settings.asset_host.presence.try do |str|
	   URI(str).host || str
	 end

	 allow = Rails.env.development? ||
	         Settings.cors_hosts == '*' ||
	         (request_host && request_host == asset_host) ||
	         (Settings.cors_hosts.present? && request_host.in?(Settings.cors_hosts.split(',')))

	 if allow
	   headers['Access-Control-Allow-Origin'] = request.headers['Origin']
	   headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, PATCH, DELETE, HEAD, OPTIONS'
	   headers['Access-Control-Allow-Credentials'] = 'true'

	   if request.headers['Access-Control-Request-Headers']
	     headers['Access-Control-Allow-Headers'] = request.headers['Access-Control-Request-Headers']
	   end

	   return true
	 end

	 false
	end
end