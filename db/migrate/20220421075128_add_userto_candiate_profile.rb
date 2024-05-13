# frozen_string_literal: true

class AddUsertoCandiateProfile < ActiveRecord::Migration[5.2]
  def change
    add_reference :candidate_profiles, :user, index: true
  end
end
