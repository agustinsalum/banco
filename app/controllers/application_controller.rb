class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configurar_parametros_adicionales_permitidos, if: :devise_controller?

    def destroy_user_session_path
        puts " ssdssd"
      end

    protected
  
    def configurar_parametros_adicionales_permitidos
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    end
end
