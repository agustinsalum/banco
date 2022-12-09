class TurnsController < ApplicationController

  def index
    # https://guides.rubyonrails.org/active_record_querying.html

    if (current_user.role == 'Administrador')
      # Todos los turnos pendientes o atendidos, menos los cancelados

      turns = Turn.where(state: 'Pendiente').or(Turn.where(state: 'Atendido'))
      @turns = turns.paginate(page: params[:page])
    elsif (current_user.role == 'Empleado')
      # Todos los turnos con estado pendiente, pertenecientes a la sucursal donde trabaja

      @subsidiary = current_user.subsidiary
      turns = Turn.where(subsidiary: @subsidiary)
      @turns = turns.paginate(page: params[:page])
    else
      # Cliente
      # Todos los turnos del cliente
      
      turns = Turn.where(user_client_id: current_user)
      @turns = turns.paginate(page: params[:page])
    end
  end

  def new
    @turn = Turn.new
    @subsidiaries = Subsidiary.all
  end


  def create
  end



  def show
  end

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
