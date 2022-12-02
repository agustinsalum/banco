class ApplicationController < ActionController::Base
    before_action :configurar_parametros_adicionales_permitidos, if: :devise_controller?

    #before_action do
    #    resource = controller_name.singularize.to_sym
    #    method = "#{resource}_params"
    #    params[resource] &&= send(method) if respond_to?(method, true)
    #end

    protected
  
    def configurar_parametros_adicionales_permitidos
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    end
end
