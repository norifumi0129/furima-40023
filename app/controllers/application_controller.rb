class ApplicationController < ActionController::Base
  before_action :basic_auth
end
