# frozen_string_literal: true

class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :user_id, foreign_key: true, index: true, null: false
      t.references :constituency, foreign_key: true, index: true, null: false
      t.integer :candidate_id, foreign_key: { to_table: 'user' }, index: true, null: false
      t.references :election, foreign_key: true, index: true, null: false
      t.datetime :cast_time, null: false

      t.timestamps
    end
  end
end
