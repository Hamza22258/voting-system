# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :authorize_voter
  before_action :find_candidates, only: %i[index search]

  # get '/votes'
  def index
    @candidates = User.where(role: 1).page(params[:page]).per(5)
    @election = Election.where(status: 2)
    render 'index'
  end

  # get '/new'
  def new
    @election = Election.find_by(status: 0)
    @vote_status, @voted_to, @election_status = VoteCastService.call(current_user)
    if Election.exists?(status: 2)
      @won_candidates, @votes = ConstituencyWinService.call(Election.find_election)
      @won_candidates = @won_candidates.page(params[:page]).per(1)
    end
    @candidates = User.where(role: 1, constituency_id: current_user.constituency_id)
  end

  # post '/votes'
  def create
    election_status = Election.exists?(status: 0)
    return unless election_status == true

    @vote = VoteCreateService.call(params[:id], current_user)
    if @vote == true
      redirect_to action: 'new'
    else
      flash[:alert] = 'Not able to save'
      render 'new'
    end
  end

  def search
    render 'new' if @won_candidates.nil?
    @won_candidates = ConstituencyWinSearchService.call(@won_candidates, params[:search]).page(params[:page]).per(1)
    render 'new'
  end

  private

  def authorize_voter
    authorize :vote
  end

  def find_candidates
    @won_candidates, @votes = ConstituencyWinService.call(Election.find_by(status: 2).id)
  end
end
