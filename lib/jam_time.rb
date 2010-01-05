module JamTime
  class Music

    # Creates a Music instance and calls #update.
    def self.update(*args)
      new(*args).update
    end

    # +dir+ should be the root directory containing the music files.
    def initialize(dir = AppConfig[:music], opts = {})
      @dir = dir
      @opts = opts
      @opts[:output] ||= true
    end

    # Updates all music file database entries.
    def update
      scan_music
    end

    private

    def scan_music(dir = @dir)
      $stdout.puts "Scanning directory: #{dir}" if @opts[:output]
      Dir["#{dir}/*"].each do |path|
        File.directory?(path) ? scan_music(path) : read_song(path)
      end
    end

    def read_song(path)
      filetype = File.extname(path).gsub(/^\./, '').downcase
      return unless Song::FILETYPES.include?(filetype)
      begin
        Mp3Info.open(path) { |mp3| update_track(mp3.tag, path) }
      rescue => error
        # Rails.logger.error "Not a music file: #{error}"
        $stdout.puts "-- DEBUG: #{error}"
      end
    end

    def update_track(id3, path)
      artist = Artist.find_or_create_by_name(sanitize_tag(id3.artist))
      album  = Album.find_or_create_by_name(sanitize_tag(id3.album))
      song   = Song.find_or_create_by_title(sanitize_tag(id3.title))

      album.artist = artist
      song.artist = artist
      song.album = album
      song.path = path

      artist.save!
      album.save!
      song.save!
    end

    def sanitize_tag(tag)
      return '<Unknown>' unless tag && !tag.blank?
      tag.force_encoding('ASCII-8BIT')
      tag.gsub(/[^\x20-\x7e]/, '')
    end

  end # Music
end # JamTime
