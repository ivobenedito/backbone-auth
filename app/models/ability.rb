class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all

    if user.role? :admin
      can :create, Article
      can :update, Article do |article|
        article && article.user == user
      end
      can :destroy, Article do |article|
        article && article.user == user
      end
    end
  end
end