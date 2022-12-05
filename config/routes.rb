Rails.application.routes.draw do
  # Rutas devise y controlador users
  devise_for :users
  resources :users do
    # Para que no pida parametros
    collection do
      get 'perfil', action: 'perfil', as: :perfil
    end
  end

  # Rutas turnos
  resources :turns
  

  # Rutas sucursales que contiene chedules
  resources :subsidiaries do
    resources :schedules 
  end

   # Rutas sucursales que contiene chedules
   resources :localities

  # Ruta root
  root to: "home#index"
end
