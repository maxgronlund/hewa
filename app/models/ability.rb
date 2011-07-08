class Ability
  include CanCan::Ability

  def initialize(user)
    if user 
      if user.super?
        can :manage, :all
      elsif user.admin?
        can :manage, TextContent
        
        
        
      elsif user.member?
        # Ordinary user
        can :manage, User, :id => user.id # <--- Allow user to manage self
        
      end
    # When not logged in
    else
#      can :read, Blog
      
      can :create, User# <----------- Uncomment this to alow users to signup by them self 
    end
  end
end
