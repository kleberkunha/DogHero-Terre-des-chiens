class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :manage, Event, user_id: user.id
      can :manage, Dog, user_id: user.id
      can [:read, :create], :all
    end
  end
end
