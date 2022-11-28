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
  end
end
