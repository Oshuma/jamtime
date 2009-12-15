class Song < ActiveRecord::Base
  validates_presence_of :path

  before_save :update_tag

  private

  def update_tag
    begin
      Mp3Info.open(path) do |mp3|
        tag = mp3.tag
        [ :title, :artist, :album, :genre ].each do |id3_tag|
          id3_value = tag.send(id3_tag)
          if id3_value
            self.send("#{id3_tag}=", id3_value)
          end
        end
      end
    rescue => error
      Rails.logger.error "Not a music file: #{error}"
    end
  end

  class << self
    def find_by_path(path)
      return nil unless File.exists?(path)
      find_or_create_by_path(path)
    end

    def find_by_path!(*args)
      song = find_by_path(*args)
      raise ActiveRecord::RecordNotFound unless song
      song
    end
  end # self

end # Song
