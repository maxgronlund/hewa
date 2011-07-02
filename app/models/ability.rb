class Ability
  include CanCan::Ability

  def initialize(user)
    if user 
      if user.super?
        can :manage, :all
      elsif user.admin?
        can :manage, TextContent
        can :manage, ProductLine
        
     
      elsif user.member?#ordinary user
        can :read, ProductLine
        can :manage, User, :user_id => user.id
       
        
       
      end
    # When not logged in
    else
     can :read, ProductLine
     can :create, User
    
     #can :create, User
    end
  end
end
