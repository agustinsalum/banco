Rails.application.routes.draw do
  get 'user_management/index'
  get 'user_management/new'
  get 'user_management/perfil'
  get 'user_management/edit'
  get 'user_management/show'
  get 'user_management/destroy'
  #
  get 'turns/index'
  get 'turns/new'
  get 'turns/show'
  get 'turns/edit'
  get 'turns/select_localities'
  get 'turns/select_subsidiaries'
  get 'turns/select_turn'
  delete 'turns/destroy'
  post 'turn/create'
  post 'turn/update'
  #
  devise_for :users
  #resources :turns
  get 'sessions/landing_page'
  get 'sessions/profile'
  get 'sessions/reset'
  root 'sessions#landing_page'
end
