module Tenant
  extend ActiveSupport::Concern

  included do
    set_current_tenant_through_filter
    before_action  :set_tenant
  end

  private

  def set_tenant
    set_current_tenant(current_user.account) if user_signed_in?
  end
end