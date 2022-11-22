class SessionsController < ApplicationController
  before_action :authenticate_user!


  def landing_page
  end

  def profile
  end

  def reset
  end
end