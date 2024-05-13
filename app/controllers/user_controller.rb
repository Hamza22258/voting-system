# frozen_string_literal: true

class UserController < ApplicationController
  # get '/profile'
  def show
    @election_status_candidate = Election.exists?(status: [0, 2])
    return unless current_user.voter?

    election_status = Election.exists?(status: 0)
    @vote_status = false
    return unless election_status

    election_id = Election.find_election
    @vote_status = Vote.exists?(user_id: current_user.id, election_id: election_id)
  end

  # get '/home'
  def home
    authorize :election
    @votes_status = Election.exists?(status: 2)
    @count_status = Election.exists?(status: 0)
    return unless @votes_status == true

    @votes, @total_votes, @win_status = ElectionWinService.call(current_user)
    @votes = @votes.page(params[:page]).per(5)
  end
end
