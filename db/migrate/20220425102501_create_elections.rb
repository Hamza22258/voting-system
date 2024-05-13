# frozen_string_literal: true

class CreateElections < ActiveRecord::Migration[5.2]
  def change
    create_table :elections do |t|
      t.datetime :start_date, null: false
      t.integer :duration, null: false
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
