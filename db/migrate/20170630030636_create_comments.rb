class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.string :content

      t.timestamps
    end
    add_index :comments, [:user_id, :created_at]
    add_index :comments, [:post_id, :created_at]
  end
end
