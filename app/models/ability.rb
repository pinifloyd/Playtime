class Ability
  include CanCan::Ability
  
  def initialize(user)    
    can :manage, :all if user.role == "admin"
    can :read, :all if user.role == "orders_operator"
    #can :update, Product if user.role == "orders_operator"
    can :create, Comment if user.role == "orders_operator"
  end
end