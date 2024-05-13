# frozen_string_literal: true

ElectionPolicy = Struct.new(:user, :elections) do
  def index?
    user.voter? || user.admin?
  end

  def search?
    user.voter? || user.admin?
  end

  def show?
    user.voter? || user.admin?
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def home?
    user.candidate?
  end
end
