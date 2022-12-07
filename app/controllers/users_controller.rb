class UsersController < ApplicationController
  
  def index
    @users = User.all.paginate(page: params[:page])
  end

  def new
    @user = User.new
    @roles = User.roles.keys
  end

  def create
    puts "ENTREEEEEEEEEEEEEEEEEEEEEEEEE"
  end

  def edit
    @usuario = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @un_usuario = User.find(params[:id])
    @un_usuario.destroy
    flash[:message] = "El usuario con email: #{@un_usuario.email} ha sido eliminado del sistema"
    redirect_to users_path
  end

  # Otras funciones

  def perfil
  end


end
