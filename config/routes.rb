Rails.application.routes.draw do
  # Rutas devise
  devise_for :users, path_names: {
    # https://github.com/heartcombo/devise#configuring-routes
    # Me permite crear usuarios
    # Debemos especificar el path para registro, asi evitamos la colision
    # enmascarando la ruta
    registration: 'register'
  }

  resources :users do
    # Para que no pida parametros
    collection do
      get   'perfil'                 , action: 'perfil'                 , as: :perfil
    end
    # Para que pida parametrros
    member do
      get   'cambiar_pass'     , action: 'cambiar_pass'     , as: :cambiar_pass
      post  'actualizar_pass'  , action: 'actualizar_pass'  , as: :actualizar_pass
    end
  end

  # Rutas turnos
  resources :turns do
    # Para que pida parametrros
    member do
      get 'attention', action: 'attention', as: :attention
      post 'create_comment', action: 'create_comment', as: :create_comment
    end
  end
  

  # Rutas sucursales que contiene chedules
  resources :subsidiaries do
    resources :schedules 
  end

   # Rutas sucursales que contiene chedules
   resources :localities

  # Ruta root
  root to: "home#index"
end
