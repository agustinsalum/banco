class SchedulesController < ApplicationController
  before_action :set_subsidiary
  def index
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.subsidiary = @subsidiary
    if @schedule.save()
      flash[:success] = "Se creo satisfactoriamente el horario en el dia #{@schedule.day_week} entre #{@schedule.hour_since} y #{@schedule.hour_until} para la sucursal #{@subsidiary.name_subsidiary}"
    else
      errores = @schedule.errors.full_messages
      flash[:danger] = "Error: #{errores}"
    end
    redirect_to subsidiaries_path 
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
  
  def schedule_params
    params.require(:schedule).permit(:day_week, :hour_since, :hour_until, :subsidiary_id)
  end
end
