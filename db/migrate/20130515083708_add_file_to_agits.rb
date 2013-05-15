class AddFileToAgits < ActiveRecord::Migration
  def change
    add_column :agits, :file, :string
  end
end
