class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.member?
      can :read, :all
      can :manage, Review, user_id: user.id
    else
      can :read, :all
    end
  end
end
