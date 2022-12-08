# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    if user.role == 'Administrador'

      # Puedo eliminar a todos los usuarios, menos a mi mismo
      can :destroy, User do |u|
        u.id != user.id
      end

      # Privilegios totales
      can :manage, User
      can :manage, Subsidiary
      can :manage, Locality
      can :manage, Schedule

    elsif user.role == 'Empleado'
      # No puede acceder ni hacer operaciones para las localidades
      cannot :manage, Locality

      # Puede solamente visualizar informacion de sucursales
      can :read, Subsidiary
      
      # Puede solamente visualizar los horarios de las sucursales
      can :read, Schedule

    else # Cliente

      # No puede acceder ni hacer operaciones para las localidades, sucursales y horarios
      cannot :manage, Locality
      cannot :manage, Subsidiary
      cannot :manage, Schedule
      
      can :read, User do |u|
        u.id == user.id
      end

      can :update, User do |u|
        u.id == user.id
      end

      # Solo puede crear turnos
      can :create, Turn
    end



  end
end
