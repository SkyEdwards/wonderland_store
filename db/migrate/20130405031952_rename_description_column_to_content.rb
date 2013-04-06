class RenameDescriptionColumnToContent < ActiveRecord::Migration
  def up
    rename_column :pages, :description, :content
  end

  def down
    rename_column :pages, :description, :content
  end
end
