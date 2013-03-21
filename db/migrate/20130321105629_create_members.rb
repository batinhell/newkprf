class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :description
      t.text :biography
      t.text :image

      t.timestamps
    end
  end
end
