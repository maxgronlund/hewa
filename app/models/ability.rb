class Ability
  include CanCan::Ability

  def initialize(user)
    if user 
      if user.super?
        can :manage, :all
      elsif user.admin?
        can :manage, TextContent
        
        
        
      elsif user.member?#ordinary user
       can :manage, User, :user_id => user.id
        
       
      end
    # When not logged in
   else
     can :create, User

#     can :read, Blog
    
     #can :create, User# <----------- Uncomment this to alow users to signup by them self 
    end
  end
end
