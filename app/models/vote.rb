# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :constituency
  belongs_to :election
  belongs_to :user
  belongs_to :candidate, class_name: 'User'
end
