class ApplicationController < ActionController::Base
  include Tenant

  before_action :authenticate_user!

end
