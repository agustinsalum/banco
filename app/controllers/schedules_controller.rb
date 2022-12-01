class SchedulesController < ApplicationController
  before_action :set_subsidiary
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private
  def set_subsidiary
    @subsidiary = Subsidiary.find(params[:subsidiary_id])
  end
end
