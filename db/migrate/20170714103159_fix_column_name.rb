class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :isActivity, :activated
  end
end
