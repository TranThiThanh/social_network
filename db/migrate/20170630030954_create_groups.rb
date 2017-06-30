class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.references :user, foreign_key: true
      t.string :name_group
      t.string :description
      t.string :recent_news
      t.string :privacy

      t.timestamps
    end
    add_index :groups, [:owner_id, :created_at]
  end
end
