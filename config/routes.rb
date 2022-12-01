Rails.application.routes.draw do
  get 'home/index'
  get 'home/show'
  # Rutas usuarios
  devise_for :users
  resources :users
  # Rutas horarios
  # Rutas sucursales
  resources :subsidiaries do
    resources :schedules 
  end

  # Rutas turnos
  resources :turns

  root to: "home#index"
end
