Rails.application.routes.draw do
  get 'subsidiary_management/index'
  get 'subsidiary_management/show'
  get 'subsidiary_management/new'
  get 'subsidiary_management/create'
  get 'subsidiary_management/edit'
  get 'subsidiary_management/update'
  get 'subsidiary_management/new_schedule'
  get 'subsidiary_management/assing_schedule'
  delete 'subsidiary_management/destroy'
  #
  get 'user_management/index'
  get 'user_management/new'
  get 'user_management/perfil'
  get 'user_management/edit'
  get 'user_management/show'
  delete 'user_management/destroy'
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
  get 'sessions/landing_page'
  get 'sessions/profile'
  get 'sessions/reset'
  root 'sessions#landing_page'
  #
  devise_for :users
  #resources :turns
end
