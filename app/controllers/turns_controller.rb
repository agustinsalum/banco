class TurnsController < ApplicationController

  def index
    # El usuario actual lo obtenemos con current_user
    todos_turnos = Turn.all
    @turnos_usuario_actual = todos_turnos.select { |un_turno| un_turno.user_client_id == current_user.id}
  end

  def show
  end

  def update
  end

  def delete
  end
end
