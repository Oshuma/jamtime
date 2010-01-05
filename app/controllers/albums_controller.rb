class AlbumsController < ApplicationController
  def show
    @album = Album.find(params[:id], :include => [ :artist, :songs ])
  end
end
