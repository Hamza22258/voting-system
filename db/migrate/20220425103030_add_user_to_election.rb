# frozen_string_literal: true

class AddUserToElection < ActiveRecord::Migration[5.2]
  def change
    add_reference :elections, :user, foreign_key: true
  end
end
