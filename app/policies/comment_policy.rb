class CommentPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    user.try :is_admin? or is_owner?
  end

  private
  def is_owner?
    user == record.user
  end
end
