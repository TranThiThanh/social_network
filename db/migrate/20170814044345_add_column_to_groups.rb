class AddColumnToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :avatar, :string
    add_column :groups, :cover, :string
  end
end
