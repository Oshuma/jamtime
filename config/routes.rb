ActionController::Routing::Routes.draw do |map|
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.with_options :controller => 'user_sessions' do |auth|
    auth.login '/login', :action => 'new'
    auth.logout '/logout', :action => 'destroy'
  end

  map.resource :user_session

  map.resources :users do |user|
    user.resources :playlists
  end

  map.resources :genres
  map.resources :artists
  map.resources :albums

  # Namespaced URLs.
  map.resources :artists do |artist|
    artist.resources :albums do |album|
      album.resources :songs
    end
  end

  # Used to browse the music directory itself.
  map.with_options :controller => 'browse' do |music|
    music.browse '/browse/*path', :action => 'index'
    music.download '/download/:song', :action => 'download'
  end

  map.root :controller => 'browse', :action => 'index'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
