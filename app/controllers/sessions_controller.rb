class SessionsController < ApplicationController
  before_action :authenticate_user!


  def landing_page
  end

  def dashboard
  end

  def profile
  end

  def reset nueva_contraseña
    usuario = User.find(user_id)
    usuario.password = nueva_contraseña
    usuario.save
  end
end