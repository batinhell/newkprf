class AddSlugruToPages < ActiveRecord::Migration
  def change
    add_column :pages, :slug_ru, :string
    add_index :pages, :slug_ru
  end
end
