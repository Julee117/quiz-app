class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :content
      t.integer :quiz_id

      t.timestamps null: false
    end
  end
end
