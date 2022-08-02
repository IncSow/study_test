class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.string :theme
      t.timestamps
    end
    create_table :questions do |t|
      t.string :prompt
      t.string :answer
      t.timestamps
      t.bigint :quizz_id
    end
    add_foreign_key :questions, :quizzes, column: :quizz_id, primary_key: "id"
    create_table :scores do |t|
      t.bigint :quizz_id
      t.bigint :user_id
      t.integer :score
    end
    add_foreign_key :scores, :quizzes, column: :quizz_id, primary_key: "id"
    add_foreign_key :scores, :users, column: :user_id, primary_key: "id"
  end
end
