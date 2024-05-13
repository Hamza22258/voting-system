# frozen_string_literal: true

class ElectionStopWorker
  include Sidekiq::Worker
  def perform(*_args)
    election = Election.find_by(status: 0)
    return if election.nil?

    election.status = 2
    election.save
  end
end
