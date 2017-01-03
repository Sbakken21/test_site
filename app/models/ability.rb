class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
        can :create, Post
      else
        can :read, :all
        can :update, Comment, :id => user.id
         
        can :destroy, Comment, :id => user.id
        
        can :create, Comment
      end
  end
end
