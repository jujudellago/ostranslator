# Base authorization policies for Pundit
class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end
  def actions?
    user.admin? ? true  : false
  end
  

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end
  def openorders?
    false
  end
  def buylimit?
    false
  end

  def selllimit?
    false
  end
  def orderhistory?
    false
  end
  def balance?
    false

  end





  def scope
    Pundit.policy_scope!(user, record.class)
  end

  # Used by Pundit's #policy_scope
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
