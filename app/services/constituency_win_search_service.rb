# frozen_string_literal: true

class ConstituencyWinSearchService < ApplicationService
  attr_reader :won_candidates, :query

  def initialize(won_candidates, query)
    @won_candidates = won_candidates
    @query = query
    @user = Vote.new
  end

  def call
    search_result = []
    won_candidates.each do |single|
      unless single.constituency.name.downcase.include?(query.downcase) ||
             single.first_name.downcase.include?(query.downcase)
        next
      end

      search_result.push(single.id)
    end
    User.where(id: search_result)
  end
end
