class RenameFirsNameColumnToFirstName < ActiveRecord::Migration
  def up
    rename_column :customers, :firs_name, :first_name
  end

  def down
    rename_column :customers, :firs_name, :first_name
  end
end
