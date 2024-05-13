# frozen_string_literal: true

class Election < ApplicationRecord
  enum status: {
    pending: 0,
    completed: 1,
    counting: 2
  }
  has_many :votes, dependent: :destroy
  belongs_to :user
  def self.find_election
    election = Election.find_by(status: 0)
    if election.nil?
      Election.find_by(status: 2).id
    else
      election.id
    end
  end
end
