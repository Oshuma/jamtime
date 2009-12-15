class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.string :artist
      t.string :title
      t.string :album
      t.string :genre
      t.string :path, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
