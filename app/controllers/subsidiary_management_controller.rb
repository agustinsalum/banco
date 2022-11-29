class SubsidiaryManagementController < ApplicationController
  def index
    @todas_sucursales = Subsidiary.all.paginate(page: params[:page])
  end

  def new_schedule
  end

  def assing_schedule
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @una_sucursal = Subsidiary.find(params[:sucursal])
    @turnos_sucursal = @una_sucursal.turns
    @turnos_sucursal.where('state' == 'Pendiente')
    flash[:message] = "El turno con motivo:  #{@un_turno.reason_turn} con fecha: #{@un_turno.turn_date} ha sido eliminado del sistema"
    redirect_to turns_index_path
  end
end
