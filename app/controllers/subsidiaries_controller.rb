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
    else
      errores = @subsidiary.errors.full_messages
      flash[:danger] = "Error: #{errores}"
    end
    redirect_to subsidiaries_path 
  end

  def edit
    @subsidiary = Subsidiary.find(params[:id])
    @localities = Locality.all
  end

  def update
    @subsidiary = Subsidiary.find(params[:id])
    if @subsidiary.update(subsidiary_params)
      flash[:success] = "la sucursal se edito satisfactoriamente"
    else
      errores = @subsidiary.errors.full_messages
      flash[:danger] = "Error: #{errores}"
    end
    redirect_to subsidiaries_path
  end

  def destroy
    pendientes = false
    subsidiary = Subsidiary.find(params[:id])
    turns = subsidiary.turns
    if turns.length > 0
      turns.find_each do |turn|
        pendientes = true if (turn.state == "Pendiente")
      end
    end
    if !(pendientes)
      subsidiary.destroy
      flash[:success] = "la sucursal con nombre #{subsidiary.name_subsidiary} ha sido eliminada del sistema"
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
