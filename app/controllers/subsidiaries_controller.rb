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
    @nueva_sucursal = Subsidiary.new(subsidiary_params)
    if @nueva_sucursal.save()
      flash[:success] = "la sucursal con nombre #{@nueva_sucursal.name_subsidiary} ha sido creada de manera satisfactoria"
      redirect_to subsidiaries_path 
    else
      errores = @nueva_sucursal.errors.full_messages
      flash[:danger] = "Error: #{errores}"
      redirect_to subsidiaries_path
    end
  end

  def edit
    @una_sucursal = Subsidiary.find(params[:id])
    @todas_localidades = Locality.all
  end

  def update
    puts "ENTRE0"
    @sucursal_editada = Subsidiary.find(subsidiary_params)
    puts "ENTRE1"
    if @sucursal_editada.update(subsidiary_params)
      puts "ENTRE2"
      flash[:success] = "la sucursal se edito satisfactoriamente"
      redirect_to subsidiaries_path
    else
      puts "ENTRE3"
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
