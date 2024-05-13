# frozen_string_literal: true

class AddJobIdToElection < ActiveRecord::Migration[5.2]
  def change
    add_column :elections, :job_id, :string
  end
end
