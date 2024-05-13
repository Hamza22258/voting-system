# frozen_string_literal: true

class Constituency < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :votes, dependent: :destroy
end
