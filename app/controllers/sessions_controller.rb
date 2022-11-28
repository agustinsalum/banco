class SessionsController < ApplicationController
  before_action :authenticate_user!


  def landing_page
    @rol = current_user.role
  end

  def profile
  end

  def reset
  end
end