class Song < ActiveRecord::Base
  FILETYPES = %w[ mp3 ]

  validates_presence_of :name, :path
  validates_format_of :path, :with => /.+\.#{FILETYPES.join('|')}$/

  belongs_to :artist
  belongs_to :album
end
