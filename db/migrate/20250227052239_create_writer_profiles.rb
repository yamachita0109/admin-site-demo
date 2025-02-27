class CreateWriterProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :writer_profiles do |t|
      t.references :writer, null: false, foreign_key: true
      t.text :profile_text
      t.text :icon_image
      t.text :header_image
      t.string :x_id
      t.string :facebook_id
      t.string :instagram_id
      t.string :tiktok_id
      t.string :youtube_id
      t.string :discord_id
      t.string :site_url
      t.boolean :is_deleted, default: false, null: false
      t.string :wordpress_id

      t.timestamps
    end
  end
end
