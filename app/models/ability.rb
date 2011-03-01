class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if !user.new_record?
      can :create, Project
    end

    #Anyone can read a public project
    can :read, Project, :is_public => true

    #Only owners can manipulate their projects
    can [:read, :update, :destroy], Project do |project|
      project.users.include?(user)
    end
  end
end
