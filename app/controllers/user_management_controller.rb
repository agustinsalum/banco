class UserManagementController < ApplicationController
  
  def index
    @todos_usuarios = User.all.paginate(page: params[:page])
  end

  def perfil
    @un_perfil = User.find(params[:usuario])
  end

  def new
    @nuevo_usuario = User.new
  end

  def edit
  end

  def show
  end

  def destroy
    @un_usuario = User.find(params[:usuario])
    @un_usuario.destroy
    flash[:message] = "El usuario con email: #{@un_usuario.email} ha sido eliminado del sistema"
    redirect_to user_management_index_path
  end
end
