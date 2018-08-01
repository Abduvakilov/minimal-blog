class ApplicationController < ActionController::Base
	before_action :authenticate_user!, except: [:index, :show]

	def not_found
	  raise ActionController::RoutingError.new('Not Found')
	end

end
