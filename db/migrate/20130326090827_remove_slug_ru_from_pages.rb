class RemoveSlugRuFromPages < ActiveRecord::Migration
  def up
    remove_column :pages, :slug_ru
  end

  def down
    add_column :pages, :slug_ru, :string
  end
end
