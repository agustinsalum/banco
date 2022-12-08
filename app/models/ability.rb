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

    elsif user.role == 'Bancario'
      
      # No puede acceder ni hacer operaciones para las localidades
      cannot :manage, Locality

    else # Cliente

      # No puede acceder ni hacer operaciones para las localidades
      cannot :manage, Locality
      
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
