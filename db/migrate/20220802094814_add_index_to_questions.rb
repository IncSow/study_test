class AddIndexToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :index, :integer, :unique => true
  end
end
