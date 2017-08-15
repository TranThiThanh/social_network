class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.string :content

      t.timestamps
    end
    add_index :posts, [:follwer_id, :created_at]
    add_index :posts, [:follwed_id, :created_at]
  end
end
