# frozen_string_literal: true

VotePolicy = Struct.new(:user, :votes) do
  def index?
    user.voter?
  end

  def new?
    user.voter?
  end

  def create?
    user.voter?
  end

  def edit?
    user.voter?
  end

  def update?
    user.voter?
  end

  def destroy?
    user.voter?
  end

  def search?
    user.voter?
  end
end
