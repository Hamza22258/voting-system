# frozen_string_literal: true

class CandidateProfile < ApplicationRecord
  enum status: {
    pending: 0,
    approved: 1
  }
  validates  :party, presence: true
  belongs_to :user
  has_one_attached :symbol_image
end
