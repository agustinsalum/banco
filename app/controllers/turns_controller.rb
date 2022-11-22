class TurnsController < ApplicationController
  def index
    @turnos_usuario_actual = Turn.all
  end

  def show
  end

  def update
  end

  def delete
  end
end
