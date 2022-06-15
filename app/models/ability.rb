class Ability
  include CanCan::Ability

  def initialize(user)
    case user&.role
    when 'admin'
      can :manage, :all
    when 'user'
      can :update, Post do |post|
        post.author == user
      end
      can :destroy, Post do |post|
        post.author == user
      end
      can :update, Comment do |comment|
        comment.author == user
      end
      can :destroy, Comment do |comment|
        comment.author == user
      end
      can :create, Post do |post|
        post.author == user
      end
      can :create, Comment
      can :create, Like
      can :read, :all
    end
  end
end
