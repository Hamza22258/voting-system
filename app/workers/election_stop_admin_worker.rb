# frozen_string_literal: true

class ElectionStopAdminWorker
  include Sidekiq::Worker
  def perform(*_args)
    queue = Sidekiq::ScheduledSet.new
    queue.each do |job|
      job.delete if job.jid == Election.find_by(status: 2).job_id
    end
  end
end
