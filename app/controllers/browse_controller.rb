class BrowseController < ApplicationController

  def index
    @folders = []
    @songs   = []

    music_path = AppConfig[:music]
    if params[:path] && !params[:path].empty?
      music_path = File.join(music_path, params[:path].join('/'))
    end

    Dir["#{music_path}/*"].each do |path|
      if File.directory?(path)
        @folders << path.gsub(/#{AppConfig[:music]}\//, '')
      else
        filetype = File.extname(path).gsub(/^\./, '').downcase
        @songs << Song.find_by_path(path) if Song::FILETYPES.include?(filetype)
      end
    end

    @folders.compact!
    @songs.compact!
  end

  # TODO: Directory downloading (tarball or zip format).
  def download
    @song = Song.find(params[:song])
    if File.exists?(@song.path)
      send_file(@song.path)
    else
      render :text => "File not found.", :status => :not_found
    end
  end

end
