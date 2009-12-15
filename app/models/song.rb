class Song < ActiveRecord::Base
  TAGS = [ :title, :artist, :album, :genre ]

  validates_presence_of :path

  before_save :update_tag

  class << self
    def find_by_path(path)
      path = File.expand_path(path)
      return nil unless File.exists?(path)
      # TODO: Handle formats other than MP3.
      return nil unless File.extname(path).downcase == '.mp3'
      find_or_create_by_path(path)
    end

    def find_by_path!(*args)
      song = find_by_path(*args)
      raise ActiveRecord::RecordNotFound unless song
      song
    end
  end # self

  private

  def update_tag
    begin
      Mp3Info.open(path) do |mp3|
        id3 = mp3.tag
        TAGS.each do |tag|
          value = id3.send(tag)
          if value
            # Properly encode the tag.
            value = value.unpack("U*").map{ |c| c.chr }.join
            self.send("#{tag}=", value)
          end
        end
      end
    rescue => error
      Rails.logger.error "Not a music file: #{error}"
    end
  end

end # Song
