# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    if user.role == 'Administrador'

      # Privilegios totales
      can :manage, Subsidiary
      can :manage, Locality
      can :manage, Schedule
      can [ :read, :show, :create, :update ], User


      # Puede eliminar a todos los usuarios, pero no a si mismo
      can :destroy, User do |u|
        u.id != user.id
      end

      # No puede acceder a los turnos
      cannot :manage, Turn






    elsif user.role == 'Empleado'

      # No puede acceder ni hacer operaciones para las localidades
      cannot :manage, Locality

      # Puede solamente visualizar informacion de sucursales
      can :read, Subsidiary
      
      # Puede solamente visualizar los horarios de las sucursales
      can :read, Schedule

      # Puede solamente visualizar la informacion de los usuarios y sus perfiles
      can [ :read, :show ], User
      
      # No puede crear, actualizar ni eliminar
      cannot [ :create, :update, :destroy], Turn

      # Puede ver los turnos pertenecientes a su sucursal
      can :read, Turn do |t|
        t.subsidiary == user.subsidiary
      end
      
      # puede atender turnos de mi sucursal
      can [ :attention, :create_comment ], Turn do |t|
        t.subsidiary_id == user.subsidiary_id
      end




    else # Cliente

      # No puede acceder ni hacer operaciones para las localidades, sucursales, horarios y usuarios
      cannot :manage, Locality
      cannot :manage, Subsidiary
      cannot :manage, Schedule
      cannot :manage, User

      # Puede crear turnos
      can [ :read, :create], Turn

      # Puede editar y eliminar turnos propios
      can [ :update, :destroy ], Turn do |t|
        t.user_client_id == user.id
      end



    end
  end
end
