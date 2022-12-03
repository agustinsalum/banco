class SchedulesController < ApplicationController
  before_action :set_subsidiary
  def index
  end

  def show
  end

  def new
    @nuevo_horario = Schedule.new
    @una_sucursal = Subsidiary.find(params[:subsidiary_id])
    @dias_semana = Schedule.dias
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
