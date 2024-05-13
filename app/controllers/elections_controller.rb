# frozen_string_literal: true

class ElectionsController < ApplicationController
  before_action :authorize_voter, except: %i[show index]
  before_action :find_id, only: %i[show search update]

  # get '/elections'
  def index
    @elections = Election.all
    authorize @elections
  end

  # get '/elections/:id'
  def show
    authorize :election
    return unless @election.completed?

    @won_candidates, @votes = ConstituencyWinService.call(params[:id])
    @won_candidates = @won_candidates.page(params[:page]).per(1)
  end

  # get '/elections/new'
  def new
    @election_status = Election.exists?(status: [0, 2])
    @election = Election.new

    render 'election'
  end

  # post '/elections'
  def create
    @election = ElectionStartService.call(current_user, election_params[:duration])
    if @election == true
      redirect_to action: 'new'
    else
      flash[:alert] = 'Not able to save'
      render 'new'
    end
  end

  # put '/elections'
  def update
    if params[:route_to] == 'stop'
      @election.status = 1
    else
      @election.status = 2
      ElectionStopAdminWorker.perform_async
    end
    flash[:alert] = 'Not able to save' unless @election.save
    redirect_to action: 'new'
  end

  def search
    @won_candidates, @votes = ConstituencyWinService.call(@election.id)
    render 'show' if @won_candidates.nil?
    @won_candidates = ConstituencyWinSearchService.call(@won_candidates, params[:search]).page(params[:page]).per(1)
    render 'show'
  end

  private

  def election_params
    params.require(:election).permit(:duration)
  end

  def authorize_voter
    authorize :election
  end

  def find_id
    @election = Election.find(params[:id])
  end
end
