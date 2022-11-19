Rails.application.routes.draw do
  get 'sessions/landing_page'
  get 'sessions/dashboard'
  devise_for :users
  root 'sessions#landing_page'
  get 'dashboard', to: 'home#dashboard'
end
