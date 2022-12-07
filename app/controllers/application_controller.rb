class ApplicationController < ActionController::Base
    before_action :configurar_parametros_adicionales_permitidos, if: :devise_controller?
    #prepend_before_action :require_no_authentication, only: :cancel
    #prepend_before_action :require_no_authentication, only: [:create, :cancel]

    protected
  
    def configurar_parametros_adicionales_permitidos
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    end
end
