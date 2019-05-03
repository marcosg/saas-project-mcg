class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  set_current_tenant_through_filter
  before_action :set_tenant

  protected

  def set_tenant
    if current_user
      current_account = current_user.account
      set_current_tenant(current_account)
    end
  end
end
