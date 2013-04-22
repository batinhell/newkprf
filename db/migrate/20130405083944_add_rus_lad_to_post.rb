class AddRusLadToPost < ActiveRecord::Migration
  def change
    add_column :posts, :rus_lad, :boolean
  end
end
