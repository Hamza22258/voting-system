# frozen_string_literal: true

class CreateConstituencies < ActiveRecord::Migration[5.2]
  def change
    create_table :constituencies do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
