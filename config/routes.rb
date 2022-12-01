Rails.application.routes.draw do
  # Rutas devise y controlador users
  devise_for :users
  resources :users do
    get 'perfil', to: 'users#perfil', as: :perfil
  end

  # Rutas turnos
  resources :turns
  

  # Rutas sucursales que contiene chedules
  resources :subsidiaries do
    resources :schedules 
  end

  # Ruta root
  root to: "home#index"
end
