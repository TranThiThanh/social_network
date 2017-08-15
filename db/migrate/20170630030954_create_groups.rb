class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.integer :owner_id, references: :user
      t.string :name_group
      t.string :description
      t.string :recent_news
      t.string :privacy

      t.timestamps
    end
    add_index :groups, [:owner_id, :created_at]
  end
end
