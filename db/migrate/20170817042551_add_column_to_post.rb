class AddColumnToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :group, foreign_key: true
    add_column :groups, :avatar, :string
    add_column :groups, :cover, :string
  end
end
