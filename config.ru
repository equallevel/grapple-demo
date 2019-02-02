# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

if ENV['RAILS_RELATIVE_URL_ROOT'].present? && !ENV['IN_PASSENGER'].present?
	# Handle URL path prefix in docker/puma environments
	map ENV['RAILS_RELATIVE_URL_ROOT'] do
		run Rails.application
	end
else
	run Rails.application
end