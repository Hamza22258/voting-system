# frozen_string_literal: true

class User < ApplicationRecord
  scope :pending_candidates, -> { joins(:candidate_profile).where('candidate_profiles.status = 0') }
  scope :find_voters, ->(id) { includes(:constituency).where(constituency_id: id, role: 0) }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: {
    voter: 0,
    candidate: 1,
    admin: 2
  }
  belongs_to :constituency
  has_one :candidate_profile, dependent: :destroy
  has_one_attached :profile_picture
  has_many :elections, dependent: :destroy
  has_many :votes, dependent: :destroy
  # has_many :candidate_votes, class_name: 'Vote'
  validates :cnic, length: { minimum: 13, maximum: 13, allow_blank: false }, uniqueness: true

  def approve_candidate
    candidate = CandidateProfile.find_by(user_id: id)
    candidate.status = 1
    candidate.save
    self.role = 1
  end
end
