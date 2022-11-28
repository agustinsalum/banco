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
    flash[:notice] = "El turno ha sido eliminado"
    redirect_to controller: :orders, action: :index, method: :post
  end
end
