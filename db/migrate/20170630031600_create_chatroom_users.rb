class CreateChatroomUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :chatroom_users do |t|
      t.references :user, foreign_key: true
      t.references :chatroom, foreign_key: true

      t.timestamps
    end
    add_index :chatroom_users, [:user_id, :created_at]
    add_index :chatroom_users, [:chatroom_id, :created_at]
  end
end
