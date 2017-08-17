class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.references :group, foreign_key: true
      t.integer :sender_id, references: :user
      t.integer :recipient_id, references: :user
      t.boolean :accepted, default: false

      t.timestamps
    end
    add_index :invites, [:group_id, :created_at]
    add_index :invites, [:sender_id, :recipient_id], unique: true
  end
end
