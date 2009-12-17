class BrowseController < ApplicationController

  def index
    music_path = AppConfig[:music]
    if params[:path] && !params[:path].empty?
      music_path = File.join(music_path, params[:path].join('/'))
    end

    @folders = []
    @songs   = []

    Dir["#{music_path}/*"].each do |path|
      if File.directory?(path)
        @folders << path.gsub(/#{AppConfig[:music]}\//, '')
      else
        # @songs << Song.find_by_path(path)
        @songs << path
      end
    end
  end

end
