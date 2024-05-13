# frozen_string_literal: true

class VoteCreateService < ApplicationService
  attr_reader :user, :id, :current_user

  def initialize(id, current_user)
    @id = id
    @current_user = current_user
    @user = Vote.new
  end

  def call
    @user.candidate_id = @id
    @user.user_id = @current_user.id
    @user.cast_time = DateTime.current
    @user.election_id = Election.find_by(status: 0).id
    @user.constituency_id = @current_user.constituency_id
    return true if @user.save

    @user
  end
end
