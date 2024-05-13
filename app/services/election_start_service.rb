# frozen_string_literal: true

class ElectionStartService < ApplicationService
  attr_reader :params, :current_user, :election

  def initialize(current_user, params)
    @params = params
    @current_user = current_user
    @election = Election.new
  end

  def call
    @election.user_id = @current_user.id
    @election.start_date = DateTime.now.in_time_zone('Asia/Karachi')
    @election.duration = @params
    @election.end_date = @election.start_date + @election.duration.days
    @election.job_id = ElectionStopWorker.perform_at(@election.end_date)
    return true if @election.save

    @election
  end
end
