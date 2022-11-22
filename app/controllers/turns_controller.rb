class TurnsController < ApplicationController
  def index
    @todos_turnos = Turn.all
  end

  def show
    @mis_turnos = Turn.all
    #@mis_turnos = Turn.find(params[:id])
  end
end
