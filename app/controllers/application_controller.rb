class ApplicationController < ActionController::Base
  # By default, asks for login/signup for every action
  before_action :authenticate_user!
  # If we add more columns to user model, we need a before_action callback that
  # calls the the devise method configure_permitted_parameters
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  # From Devise, to be added when we add more columns to user model
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:first_name, :last_name, :country])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:first_name, :last_name, :country])
  end

  protected

  def after_sign_in_path_for(resource)
    contents_path
  end
end
