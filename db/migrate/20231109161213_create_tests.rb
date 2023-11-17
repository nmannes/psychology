# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.timestamps
      t.string :test_type
      t.integer :age
      t.string :gender
      t.string :education
      t.string :stages, :text, array: true, default: [].to_yaml
      t.json :data, default: {}
      t.references :user, null: false, foreign_key: true
    end
  end
end
