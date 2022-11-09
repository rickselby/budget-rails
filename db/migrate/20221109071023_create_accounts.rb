# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :credit
      t.references :budget, null: false, foreign_key: true

      t.timestamps
    end
  end
end
