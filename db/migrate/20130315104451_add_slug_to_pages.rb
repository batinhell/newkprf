class AddSlugToPages < ActiveRecord::Migration
  def change
    add_column :pages, :slug_en, :string
    add_index :pages, :slug_en
  end
end
