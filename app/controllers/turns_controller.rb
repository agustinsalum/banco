class TurnsController < ApplicationController

  def index
    # https://guides.rubyonrails.org/active_record_querying.html

    if (current_user.role == 'Administrador')
      # Todos los turnos pendientes o atendidos, menos los cancelados (orden ascendente)

      turns = Turn.where(state: 'Pendiente').or(Turn.where(state: 'Atendido'))
      @turns = turns.paginate(page: params[:page]).order("turn_date ASC")
    elsif (current_user.role == 'Empleado')
      # Todos los turnos con estado pendiente, pertenecientes a la sucursal donde trabaja (orden ascendente)

      @subsidiary = current_user.subsidiary
      turns = Turn.where(subsidiary: @subsidiary)
      @turns = turns.paginate(page: params[:page]).order("turn_date ASC")
    else
      # Cliente
      # Todos los turnos del cliente (orden ascendente)
      
      turns = Turn.where(user_client_id: current_user)
      @turns = turns.paginate(page: params[:page]).order("turn_date ASC")
    end
  end

  def new
    @turn = Turn.new
    @subsidiaries = Subsidiary.all
  end


  def create
    @turn = Turn.new(turn_params)
    @turn.state = 'Pendiente'
    @turn.user_client = current_user
    if @turn.save()
      flash[:success] = "el turno con fecha #{@turn.turn_date.strftime('%m/%d/%Y')} y hora #{@turn.hour.strftime("%H:%M")} ha sido creada de manera satisfactoria"
    else
      errores = @turn.errors.full_messages
      flash[:danger] = "Error: #{errores}"
    end
    redirect_to turns_path 
  end



  def show
  end

  def edit
    @turn = Turn.find(params[:id])
    @subsidiaries = Subsidiary.all
  end

  def update
    @turn = Turn.find(params[:id])
    if @turn.update(turn_params)
      flash[:success] = "El turno se edito satisfactoriamente"
    else
      errores = @turn.errors.full_messages
      flash[:danger] = "Error: #{errores}"
    end
    redirect_to turns_path
  end

  def destroy
    @un_turno = Turn.find(params[:id])
    @un_turno.destroy
    flash[:message] = "El turno con motivo:  #{@un_turno.reason_turn} con fecha: #{@un_turno.turn_date} ha sido eliminado del sistema"
    redirect_to turns_path
  end


  private
  
  def turn_params
    params.require(:turn).permit(:turn_date, :hour, :reason_turn, :subsidiary_id)
  end
end
