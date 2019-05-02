class RegistrationsController < Devise::RegistrationsController
  def new
    super do |resource|
      resource.build_account
    end
  end

  def create
    configure_permitted_parameters
    super
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [user: [:account_id], account_attributes: [:id, :name, :plan]])
  end
end


