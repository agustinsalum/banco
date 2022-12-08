class LocalitiesController < ApplicationController
  load_and_authorize_resource
  authorize_resource :locality

  def index
    @localities = Locality.all.paginate(page: params[:page])
  end

  def show
  end

  def edit
    @locality = Locality.find(params[:id])
    @provinces = Province.all
  end

  def update
    @locality = Locality.find(params[:id])
    if @locality.update(locality_params)
      flash[:success] = "la localidad se edito satisfactoriamente"
    else
      errores = @locality.errors.full_messages
      flash[:danger] = "Error: #{errores}"
    end
    redirect_to localities_path
  end

  def new
    @locality = Locality.new
    @provinces = Province.all
  end

  def create
    @locality = Locality.new(locality_params)
    if @locality.save()
      flash[:success] = "la localidad con nombre #{@locality.name_locality} ha sido creada de manera satisfactoria"
    else
      errores = @locality.errors.full_messages
      flash[:danger] = "Error: #{errores}"
    end
    redirect_to localities_path 
  end

  def destroy
    existen_sucursales = false
    locality = Locality.find(params[:id])
    subsidiaries = locality.subsidiaries
    existen_sucursales = true if subsidiaries.length > 0
    #
    if !(existen_sucursales)
      locality.destroy
      flash[:success] = "la localidad con nombre #{locality.name_locality} ha sido eliminada del sistema"
    else
      flash[:danger] = "la localidad no puede ser eliminada por tener sucursales"
    end
    redirect_to localities_path
  end

  private

  def locality_params
    params.require(:locality).permit(:name_locality, :province_id)
  end
end
