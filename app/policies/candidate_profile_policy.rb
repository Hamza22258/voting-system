# frozen_string_literal: true

CandidateProfilePolicy = Struct.new(:user, :candidate_profiles) do
  def new?
    user.voter?
  end

  def create?
    user.voter?
  end

  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.candidate?
  end
end
