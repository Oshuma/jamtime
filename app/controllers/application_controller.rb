# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication

  helper :all # include all helpers, all the time

  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  layout proc { |controller| controller.request.xhr? ? nil : 'jamtime' }

  if Rails.env == 'production'
    filter_parameter_logging :password, :password_confirmation
  end
end
