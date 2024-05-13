# frozen_string_literal: true

class VoteCastService < ApplicationService
  attr_reader :current_user

  def initialize(current_user)
    @current_user = current_user
  end

  def call
    election_status = Election.exists?(status: 0)
    return unless election_status

    election_id = Election.find_election
    vote_status = Vote.exists?(user_id: @current_user.id, election_id: election_id)
    voted_to = Vote.find_by(user_id: @current_user.id, election_id: election_id) if vote_status == true
    [vote_status, voted_to, election_status]
  end
end
