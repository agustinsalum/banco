Rails.application.routes.draw do
  get 'turns/index'
  get 'turns/show'
  get 'turns/index'
  devise_for :users
  get 'sessions/landing_page'
  get 'sessions/profile'
  get 'sessions/reset'
  root 'sessions#landing_page'
end
