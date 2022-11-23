class TurnsController < ApplicationController

  # new muestra el formulario, mientras que create procesa el formulario
  def new
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
