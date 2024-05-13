# frozen_string_literal: true

class AddConstituencyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :constituency, foreign_key: true, index: true
  end
end
