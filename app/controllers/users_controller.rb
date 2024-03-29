class UsersController < ApplicationController
  load_and_authorize_resource except:  [ :perfil ] 
  
  def index
    @users = User.all.paginate(page: params[:page]).order("role ASC")
  end

  def new
    @user = User.new
    @roles = User.roles.keys
    @subsidiaries = Subsidiary.all
  end

  def create
    @user = User.new(user_params)
    # Aunque logre ocultar el select, el mismo sigue estando
    @user.subsidiary_id = nil if (@user.role == 'Administrador')
    if @user.save()
      flash[:success] = "El usuario con nombre #{@user.name} ha sido creado de manera satisfactoria"
    else
      errores = @user.errors.full_messages
      flash[:danger] = "Error: #{errores}"
    end
    redirect_to users_path 
  end

  def edit
    @user = User.find(params[:id])
    @roles = User.roles.keys
    @subsidiaries = Subsidiary.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "El usuario se edito correctamente"
    else
      errores = @user.errors.full_messages
      flash[:danger] = "Error: #{errores}"
    end
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "El usuario con email: #{@user.email} ha sido eliminado del sistema"
    redirect_to users_path
  end

  # Otras funciones

  def perfil
  end

  def cambiar_pass
    @user = User.find(params[:id])
  end

  def actualizar_pass
    @user = User.find(params[:id])
    #password = user_param_password[:password]
    #password_confirmation = user_param_password[:password_confirmation]
    #@user.password = password
    #@user.password_confirmation = password_confirmation
    #
    if @user.update(user_param_password)
      flash[:success] = "Se actualizo la contraseña con exito"
    else
      errores = @user.errors.full_messages
      flash[:danger] = "Error: #{errores}"
    end
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :role, :password, :password_confirmation, :subsidiary_id)
  end

  def user_param_password
    params.require(:user).permit(:password, :password_confirmation)
  end




end
