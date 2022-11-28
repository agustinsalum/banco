class UserManagementController < ApplicationController
  
  def index
    @todos_usuarios = User.all.paginate(page: params[:page])
  end

  def perfil
    @un_perfil = User.find(params[:usuario])
  end

  def new
  end

  def edit
  end

  def show
  end

  def destroy
    @usuario_eliminar = User.find(params[:usuario])
    @usuario_eliminar.destroy
    flash[:notice] = "El usuario: #{@usuario_eliminar} ha sido eliminado"
    redirect_to :index, notice: "Quote was successfully created."
  end
end
