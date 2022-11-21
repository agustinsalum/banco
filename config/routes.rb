Rails.application.routes.draw do
  devise_for :users
  get 'sessions/landing_page'
  get 'sessions/dashboard'
  get 'sessions/profile'
  get 'sessions/reset'
  root 'sessions#landing_page'
end
