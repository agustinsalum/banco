class SubsidiariesController < ApplicationController
  def index
    @todas_sucursales = Subsidiary.all.paginate(page: params[:page])
  end

  def show
  end

  def new
    @sucursal = Subsidiary.new
    @todas_localidades = Locality.all
  end

  def create
    puts "entreeeeeeeeeeeeeeeeeeeee"
  end

  def edit
    @una_sucursal = Subsidiary.find(params[:id])
  end

  def update
  end

  def destroy
    pendientes = false
    una_sucursal = Subsidiary.find(params[:id])
    puts "elementooooooooooooooooooooooooooooooooo:"
    puts una_sucursal
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
    redirect_to "/subsidiaries"
  end




end
