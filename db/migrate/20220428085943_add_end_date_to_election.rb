# frozen_string_literal: true

class AddEndDateToElection < ActiveRecord::Migration[5.2]
  def change
    add_column :elections, :end_date, :datetime
  end
end
