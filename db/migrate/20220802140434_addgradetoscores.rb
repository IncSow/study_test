class Addgradetoscores < ActiveRecord::Migration[7.0]
  def change
    add_column :scores, :grade, :integer
  end
end
