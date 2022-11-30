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
    @sucursal = Subsidiary.new
    @todas_provincias = Province.all
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    pendientes = false
    una_sucursal = Subsidiary.find(params[:sucursal])
    turnos_sucursal = una_sucursal.turns
    if turnos_sucursal.length > 0
      turnos_sucursal.find_each do |turno|
        pendientes = true if (turno.state == "Pendiente")
      end
    end
    if !(pendientes)
      una_sucursal.destroy
      flash[:success] = "la sucursal con nombre #{una_sucursal.name_subsidiary} ha sido eliminada del sistema"
    else
      flash[:danger] = "la sucursal no puede ser eliminada por tener turnos pendientes"
    end
    redirect_to subsidiary_management_index_path
  end
end
