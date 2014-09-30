class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user! #-> routes to the login / signup if not authenticated


end
