# Authorization policy for Admin::UsersController. *Not* used by Devise's
# controllers.
class AccountPolicy < ApplicationPolicy
  # Used by Pundit's #policy_scope
  class Scope < Scope
    def resolve
      # Only admins can list users.
      user.admin? ? scope.all : scope.where(user_id: user.id)
    end
  end


#  %w[create? show? update? destroy? index? new?].each do |method_name|
#    define_method(method_name) do
#      byebug
#      user.present? # && user.admin?
#    end
#
#
#
#  end
  def show?
      user.present?
  end
  def openorders?
    user.present?
  end

  def edit?
      user.present?
  end
  def actions?
     user.admin? ? true  : user.present?
  end


  def new?
  #  byebug
    user.present?
  end

  def create?
    user.present?
  end
  def update?
      user.present?
  end

  def destroy?
      user.present?
  end

  def buylimit?
    user.present?
  end

  def selllimit?
      user.present?
  end
  def orderhistory?
    user.present?
  end
  def balance?
    user.present?

  end

  def reorder?
    user.present?
  end

  ## Used by Pundit's #policy_scope
  #class Scope < Scope
  #  attr_reader :user, :scope
#
  #   def initialize(user, scope)
  #     @user = user
  #     @scope = scope
  #   end
#
  #  def resolve
  #    #   byebug
  #       if @user.admin?
  #         @scope.all
  #       else
  #         @scope.where(:user_id => @user.id)
  #       end
  #     end
  #end

end
