class Admin::BasePolicy < ::ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.is_admin?
        scope.all
      else
        scope.none
      end
    end
  end

  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user

    @user = user
    @record = record
  end

  def index?
    @user.is_admin?
  end

  def show?
    @user.is_admin?
  end

  def create?
    @user.is_admin?
  end

  def new?
    @user.is_admin?
  end

  def update?
    @user.is_admin?
  end

  def edit?
    @user.is_admin?
  end

  def destroy?
    @user.is_admin?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
end

