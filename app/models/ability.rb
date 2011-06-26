class Ability
  include CanCan::Ability

  def initialize(user)
    if user 
      if user.super?
        can :manage, :all
      elsif user.admin?
#        can :manage, Blog
        
        
        
      elsif user.member?#ordinary user
        
#        can :read, Blog
#        can :create, Blog
#        can :manage, Blog, :user_id => user.id
        
       
      end
    # When not logged in
   else
#     can :read, Blog
    
     #can :create, User# <----------- Uncomment this to alow users to signup by them self 
    end
  end
end
