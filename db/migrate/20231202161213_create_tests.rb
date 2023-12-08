# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.timestamps
      t.string :test_type
      t.string :variant
      t.json :data, default: {}
      t.references :client, null: false, foreign_key: true
    end
  end
end
