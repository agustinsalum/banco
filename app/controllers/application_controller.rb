class ApplicationController < ActionController::Base
    before_action :configurar_parametros_adicionales_permitidos, if: :devise_controller?

    rescue_from CanCan::AccessDenied do |exception|
        redirect_back fallback_location: root_path, :alert => exception.message
      end

    protected
  
    def configurar_parametros_adicionales_permitidos
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    end
end
