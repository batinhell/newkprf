class AddInSliderToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :in_slider, :boolean
  end
end
