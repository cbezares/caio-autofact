class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.string :answer
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
