class Song < ActiveRecord::Base
  FILETYPES = %w[ mp3 ]

  validates_presence_of :title, :path
  validates_format_of :path, :with => /.+\.#{FILETYPES.join('|')}$/i

  belongs_to :artist
  belongs_to :album
end
