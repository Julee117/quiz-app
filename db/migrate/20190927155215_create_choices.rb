class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.text :content
      t.boolean :correct
      t.integer :question_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
