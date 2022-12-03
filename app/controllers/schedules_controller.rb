class SchedulesController < ApplicationController
  before_action :set_subsidiary
  def index
  end

  def show
  end

  def new
    @nuevo_horario = Schedule.new
  end

  def create
    @nuevo_horario = Schedule.new(subsidiary_params)
    if @nueva_sucursal.save()
      puts "SIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"
    else
      puts "NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
    end
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
  
  def subsidiary_params
    params.require(:schedule).permit(:day_week, :hour_since, :hour_until, :subsidiary_id)
  end
end
