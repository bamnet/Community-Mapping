class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    # If you already have accounts you can manage icons you own and create projects
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

    # If the project is public you can read the layer
    can :read, Layer, :project => {:is_public => true}
    # If you are a member of the project you can read the layer
    can :manage, Layer do |layer|
      layer.project.users.include?(user)
    end

    # If the project (via layer) public...
    can :read, Point, :layer => { :project => {:is_public => true }}
    # If the project (via layer) has you as a member...
    can :manage, Point do |point|
      point.layer.project.users.include?(user)
    end
  end
end
