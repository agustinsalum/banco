# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    if user.role == 'Administrador'
      return unless user.role == 'Administrador'

      # Puedo eliminar a todos los usuarios, menos a mi mismo
      can :destroy, User do |u|
        u.id != user.id
      end

      # Privilegios totales
      can :manage, User
      can :manage, Subsidiary
      can :manage, Locality

    elsif user.role == 'Bancario'
      return unless user.role == 'Bancario'

    else # Cliente

      return unless user.role  == 'Cliente'

      cannot [:read], Locality
      
      can :read, User do |u|
        u.id == user.id
      end

      can :update, User do |u|
        u.id == user.id
      end


      can :create, Turn
    end



  end
end
