class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.references :chatroom, foreign_key: true
      t.references :conversation, foreign_key: true
      t.string :content

      t.timestamps
    end
    add_index :messages, [:user_id, :created_at]
    add_index :messages, [:chatroom_id, :created_at]
    add_index :messages, [:conversation_id, :created_at]
  end
end
