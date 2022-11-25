class TurnsController < ApplicationController

  # new muestra el formulario, mientras que create procesa el formulario
  def new
    @todas_provincias = Province.all
  end

  def select_localities
    @una_provincia = Province.find(params[:provincia])
    @localidades = @una_provincia.localities
  end

  def select_subsidiaries
    @una_localidad = localities.find(params[:localidad])
    @sucursales = @una_localidad.subsidiaries
  end

  def create
  end

  def index
    # El usuario actual lo obtenemos con current_user
    todos_turnos = Turn.all
    @turnos_usuario_actual = todos_turnos.select { |un_turno| un_turno.user_client_id == current_user.id}
  end

  def show
  end

  # Edit muestra el formulario, mientras que update procesa el formulario
  def edit
  end

  def update
  end

  def destroy
    puts "holaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  end
end
