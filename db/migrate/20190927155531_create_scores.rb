class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer :value
      t.integer :quiz_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
