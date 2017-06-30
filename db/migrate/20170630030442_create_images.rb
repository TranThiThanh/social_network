class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.references :post, foreign_key: true
      t.string :name_image
      t.string :image_detail_url

      t.timestamps
    end
    add_index :images, [:post_id, :created_at]
  end
end
