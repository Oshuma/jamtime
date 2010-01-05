class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.integer :artist_id
      t.integer :album_id
      t.string :title
      t.string :path

      t.timestamps
    end
    add_index :songs, :artist_id
    add_index :songs, :album_id
  end

  def self.down
    drop_table :songs
  end
end
