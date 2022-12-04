class SubsidiariesController < ApplicationController
  def index
    @todas_sucursales = Subsidiary.all.paginate(page: params[:page])
  end

  def show
  end

  def new
    @subsidiary = Subsidiary.new
    @localities = Locality.all
  end

  def create
    @subsidiary = Subsidiary.new(subsidiary_params)
    if @subsidiary.save()
      flash[:success] = "la sucursal con nombre #{@subsidiary.name_subsidiary} ha sido creada de manera satisfactoria"
      redirect_to subsidiaries_path 
    else
      errores = @subsidiary.errors.full_messages
      flash[:danger] = "Error: #{errores}"
      redirect_to subsidiaries_path
    end
  end

  def edit
    puts "Entre al edit"
    @subsidiary = Subsidiary.find(params[:id])
    @localities = Locality.all
  end

  def update
    puts "Entre al update"
    #@sucursal_editada = Subsidiary.find(subsidiary_params)
    @sucursal_editada = Subsidiary.find(params[:id])
    if @sucursal_editada.update(subsidiary_params)
      flash[:success] = "la sucursal se edito satisfactoriamente"
      redirect_to subsidiaries_path
    else
      errores = @sucursal_editada.errors.full_messages
      flash[:danger] = "Error: #{errores}"
      redirect_to subsidiaries_path
    end
  end

  def destroy
    pendientes = false
    una_sucursal = Subsidiary.find(params[:id])
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
    redirect_to subsidiaries_path
  end

  private


  
  def subsidiary_params
    params.require(:subsidiary).permit(:name_subsidiary, :address, :phone, :locality_id)
  end
end
