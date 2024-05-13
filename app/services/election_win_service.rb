# frozen_string_literal: true

class ElectionWinService < ApplicationService
  attr_reader :current_user

  def initialize(current_user)
    @current_user = current_user
  end

  def call
    election_id = Election.find_by(status: 2).id
    votes = Vote.where(election_id: election_id,
                       candidate_id: @current_user.id)
    total_votes = Vote.where(election_id: election_id,
                             candidate_id: @current_user.id).count
    candidates =  ConstituencyWinService.call(election_id)
    win_status = candidates.where(id: @current_user.id).count
    [votes, total_votes, win_status]
  end
end
