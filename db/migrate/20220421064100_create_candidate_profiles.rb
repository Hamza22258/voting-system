# frozen_string_literal: true

class CreateCandidateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :candidate_profiles do |t|
      t.string :party, null: false

      t.timestamps
    end
  end
end
