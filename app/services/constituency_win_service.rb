# frozen_string_literal: true

class ConstituencyWinService < ApplicationService
  attr_reader :election_id

  def initialize(election_id)
    @election_id = election_id
  end

  def call
    candidates = []
    votes = HashWithIndifferentAccess.new
    calculate(candidates, votes)
  end

  private

  def calculate(candidates, votes)
    max_vote = -1
    i = 0
    Constituency.all.find_each do |iter|
      c = iter.votes.where(election_id: @election_id).group_by(&:candidate_id)
      max_vote = -1
      c.each do |candidate, vote|
        next unless vote.count > max_vote

        candidates[i] = candidate
        max_vote = vote.count
        votes[candidate] = max_vote
      end
      i += 1
    end
    [User.where(id: candidates), votes]
  end
end
