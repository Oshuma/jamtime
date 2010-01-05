module JamTime
  class << self

    def update_database
      scan_music(AppConfig[:music])
    end

    private

    def scan_music(dir)
      $stdout.puts "Scanning directory: #{dir}"
      Dir["#{dir}/*"].each do |path|
        File.directory?(path) ? scan_music(path) : update_song(path)
      end
    end

    def update_song(path)
      filetype = File.extname(path).gsub(/^\./, '').downcase
      return unless Song::FILETYPES.include?(filetype)
      begin
        Mp3Info.open(path) do |mp3|
          id3 = mp3.tag

          artist = Artist.find_or_create_by_name(sanitize_tag(id3.artist))
          album  = Album.find_or_create_by_name(sanitize_tag(id3.album))
          song   = Song.find_or_create_by_title(sanitize_tag(id3.title))

          artist.save!

          album.artist = artist
          album.save!

          song.artist = artist
          song.album = album
          song.path = path
          song.save!
        end
      rescue => error
        # Rails.logger.error "Not a music file: #{error}"
        $stdout.puts "-- DEBUG: #{error}"
      end
    end

    def sanitize_tag(tag)
      return '<Unknown>' unless tag && !tag.blank?
      tag.force_encoding('ASCII-8BIT')
      tag.gsub(/[^\x20-\x7e]/, '')
    end

  end # self
end # JamTime
