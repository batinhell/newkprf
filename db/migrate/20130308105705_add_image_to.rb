class AddImageTo < ActiveRecord::Migration
  def self.up
    add_column :posts, :image, :string
  end

  def down
  end
end
