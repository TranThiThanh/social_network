class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :actor_id
      t.integer :recipient_id
      t.references :conversation, foreign_key: true
      t.string :description
      t.string :notification_detail_url
      t.boolean :isRead

      t.timestamps
    end
    add_index :notifications, :actor_id
    add_index :notifications, :recipient_id
    add_index :notifications, [:actor_id, :recipient_id], unique: true
  end
end
