class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if !user.new_record?
      can :create, Project
      can :manage, Icon, :user_id => user.id
    end

    #Anyone can read a public project
    can :read, Project, :is_public => true
    can :read, Icon, :is_public => true

    #Only owners can manipulate their projects
    can [:read, :update, :destroy], Project do |project|
      project.users.include?(user)
    end

    can :read, Layer, :project => {:is_public => true}
    can :manage, Layer do |layer|
      layer.project.users.include?(user)
    end

    can :read, Point, :layer => { :project => {:is_public => true }}
    can :manage, Point do |point|
      point.layer.project.users.include?(user)
    end
  end
end
