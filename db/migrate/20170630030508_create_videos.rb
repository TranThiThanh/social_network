class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.references :post, foreign_key: true
      t.string :name_video
      t.string :video_detail_url

      t.timestamps
    end
    add_index :videos, [:post_id, :created_at]
  end
end
