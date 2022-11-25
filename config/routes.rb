Rails.application.routes.draw do
  get 'turns/index'
  get 'turns/new'
  get 'turns/show'
  get 'turns/edit'
  get 'turns/select_localities'
  get 'turns/select_subsidiaries'
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
