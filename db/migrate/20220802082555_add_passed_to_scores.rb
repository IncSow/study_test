class AddPassedToScores < ActiveRecord::Migration[7.0]
  def change
    add_column(:scores, :passed, :boolean)
  end
end
