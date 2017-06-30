class CreateGroupUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :group_users do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
    add_index :group_users, [:user_id, :created_at]
    add_index :group_users, [:group_id, :created_at]
  end
end
