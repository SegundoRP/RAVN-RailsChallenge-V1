class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Metodo para configurar parametros al loguearse y crearse usuario
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :first_name, :last_name, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :password_confirmation, :current_password])
  end

  # Metodo para direccionar al usuario a pagina new report en cuanto se loguea
  def after_sign_in_path_for(_resource)
    pokemons_path
  end
end
