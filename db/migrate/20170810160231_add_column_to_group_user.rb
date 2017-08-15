class AddColumnToGroupUser < ActiveRecord::Migration[5.1]
  def change
    add_column :group_users, :role, :string, default: "Member"
  end
end
