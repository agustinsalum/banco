class TurnsController < ApplicationController

  # new muestra el formulario, mientras que create procesa el formulario
  # Selecciona la provincia
  def new
    @provinces = Province.all
  end

  # Selecciona la localidad
  def select_localities
    @provinces = Province.find(params[:provincia])
    @localities = @provinces.localities
  end

  # Selecciona la sucursal
  def select_subsidiaries
    @Locality = Locality.find(params[:localidad])
    @subsidiaries = @una_localidad.subsidiaries
  end

  # Selecciona el turno
  def select_turn
    @una_sucursal = Subsidiary.find(params[:sucursal])
    @turnos = @una_sucursal.schedules
    puts "holaaaaaaaaaaaaaaaaaaaaaaaaaa"
    puts @turnos.empty?
  end

  def create
  end

  def index
    # https://guides.rubyonrails.org/active_record_querying.html
    @turns = Turn.where(user_client_id: current_user)
    @turns = @turns.paginate(page: params[:page])
  end

  def show
  end

  # Edit muestra el formulario, mientras que update procesa el formulario
  def edit
  end

  def update
  end

  def destroy
    @un_turno = Turn.find(params[:id])
    @un_turno.destroy
    flash[:message] = "El turno con motivo:  #{@un_turno.reason_turn} con fecha: #{@un_turno.turn_date} ha sido eliminado del sistema"
    redirect_to turns_path
  end
end
