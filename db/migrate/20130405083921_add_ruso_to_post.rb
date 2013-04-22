class AddRusoToPost < ActiveRecord::Migration
  def change
    add_column :posts, :ruso, :boolean
  end
end
