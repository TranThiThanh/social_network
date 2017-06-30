class CreateActivityLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_logs do |t|
      t.references :user, foreign_key: true
      t.string :activity_type
      t.string :description

      t.timestamps
    end
    add_index :activity_logs, [:user_id, :created_at]
  end
end
