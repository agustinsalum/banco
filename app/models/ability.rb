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


      # Puede eliminar a todos los usuarios, pero no a mi mismo
      can :destroy, User do |u|
        u.id != user.id
      end

      # Puede editar y cancelar todos los turnos
      can [ :update, :destroy ], Turn do |t|
        t.user_client != nil
      end

      # No puede crear turnos
      cannot :create, Turn




    elsif user.role == 'Empleado'

      # No puede acceder ni hacer operaciones para las localidades
      cannot :manage, Locality

      # Puede solamente visualizar informacion de sucursales
      can :read, Subsidiary
      
      # Puede solamente visualizar los horarios de las sucursales
      can :read, Schedule

      # Puede solamente visualizar la informacion de los usuario y sus perfiles
      can [ :read, :show ], User
      
      # No puede crear, actualizar ni eliminar
      cannot [ :create, :update, :destroy], Turn
      
      # puede atender turnos
      # can [ ], Turn

    else # Cliente

      # No puede acceder ni hacer operaciones para las localidades, sucursales, horarios y usuarios
      cannot :manage, Locality
      cannot :manage, Subsidiary
      cannot :manage, Schedule
      cannot :manage, User

      # Puede crear turnos
      can :create, Turn

      # Puede editar y cancelar turnos propios
      can [ :update, :destroy ], Turn do |t|
        t.user_client_id == user.id
      end

    end



  end
end
