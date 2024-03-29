class SchedulesController < ApplicationController
  load_and_authorize_resource
  before_action :set_subsidiary
  def index
    @schedules = @subsidiary.schedules.paginate(page: params[:page])
  end

  def show
  end

  def new
    @schedule = Schedule.new
    @days = Schedule.days_week
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.subsidiary = @subsidiary
    if @schedule.save()
      flash[:success] = "Se creo satisfactoriamente el horario en el dia #{@schedule.day_week} entre #{@schedule.hour_since.strftime("%H:%M")} y #{@schedule.hour_until.strftime("%H:%M")} para la sucursal #{@subsidiary.name_subsidiary}"
    else
      errores = @schedule.errors.full_messages
      flash[:danger] = "Error: #{errores}"
    end
    redirect_to subsidiaries_path 
  end

  def edit
    @schedule = Schedule.find(params[:id])
    @days = Schedule.days_week
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      flash[:success] = "El horario se edito satisfactoriamente"
    else
      errores = @schedule.errors.full_messages
      flash[:danger] = "Error: #{errores}"
    end
    redirect_to subsidiary_schedules_path
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:success] = "la horario con dia #{@schedule.day_week} perteneciente a la sucursal #{@subsidiary.name_subsidiary} ha sido eliminado del sistema"
    redirect_to subsidiary_schedules_path
  end


  private
  def set_subsidiary
    @subsidiary = Subsidiary.find(params[:subsidiary_id])
  end
  
  def schedule_params
    params.require(:schedule).permit(:day_week, :hour_since, :hour_until, :subsidiary_id)
  end
end
