# frozen_string_literal: true

class AddCnicToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cnic, :string
    add_index :users, :cnic, unique: true
  end
end
