class Ability
  include CanCan::Ability

  def initialize(user)
    if user 
      if user.super?
        can :manage, :all
      elsif user.admin?
        can :manage, Address
        can :manage, User
        can :manage, TextContent
        can :manage, Product
        can :manage, ProductLine
   
      elsif user.member?#ordinary user
        can :manage, Address, :user_id => user.id
        can :read, Product
        can :read, ProductLine
        can :manage, User, :user_id => user.id
        can :read, TextContent
        

      end
    else
      # When not logged in
      can :create, User # <----------- Uncomment this to alow users to signup by them self
      can :read, TextContent
      can :read, Product
      can :read, ProductLine
      can :create, User

    end
  end
end
