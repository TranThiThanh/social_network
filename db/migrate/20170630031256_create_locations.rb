class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.string :address

      t.timestamps
    end
    add_index :locations, [:user_id, :created_at]
    add_index :locations, [:post_id, :created_at]
  end
end
