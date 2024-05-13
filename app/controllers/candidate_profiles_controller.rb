# frozen_string_literal: true

class CandidateProfilesController < ApplicationController
  # get /candidate_profiles
  def index
    if current_user.admin?
      @candidates = User.pending_candidates
      render 'pending'
    elsif current_user.candidate?
      @voters = User.find_voters(current_user.constituency_id).page(params[:page]).per(5)
      render 'list'
    end
  end

  def index_admin
    return unless current_user.admin?

    @approved = User.where(role: 1)
    render 'approved_list'
  end

  # get '/new'
  def new
    @candidate = CandidateProfile.new
    authorize @candidate
  end

  # post '/candidate_profiles'
  def create
    @candidate = CandidateProfile.new(candidateship_params)
    authorize @candidate
    @candidate.user_id = current_user.id
    if @candidate.save
      redirect_to profile_path
    else
      flash[:alert] = 'Not able to save'
      render 'new'
    end
  end

  # post '/candidate_profiles'
  def update
    @user = User.find(params[:id])
    @candidate = CandidateProfile.new
    authorize @candidate
    @user.approve_candidate
    flash[:alert] = 'Not able to approve' unless @user.save
    redirect_to action: 'index'
  end

  # post /candidate_profiles/:id
  def destroy
    @user = User.find(current_user.id)
    @candidate = CandidateProfile.new
    authorize @candidate
    @user.role = 0
    @user.candidate_profile.destroy
    flash[:alert] = 'Not able to destroy' unless @user.save
    redirect_to profile_path
  end

  private

  def candidateship_params
    params.require(:candidate_profile).permit(:party, :symbol_image)
  end
end
