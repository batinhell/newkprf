class AddDepartmentIdToMembers < ActiveRecord::Migration
  def change
    change_table :members do |t|
      t.references :department
    end
  end
end
