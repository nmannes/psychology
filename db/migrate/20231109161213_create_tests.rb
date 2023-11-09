class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.timestamps
      t.integer :age, null: false
      t.string :gender, null: false
      t.string :dominant_hand
      t.json :data
      t.references :user, null: false, foreign_key: true
    end
  end
end
