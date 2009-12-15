namespace :music do
  desc 'Update music database'
  task :update => [ :environment ] do
    scan_music(AppConfig[:music])
  end
end

private

def scan_music(dir)
  Dir["#{dir}/*"].each do |path|
    File.directory?(path) ? scan_music(path) : update_song(path)
  end
end

def update_song(path)
  if song = Song.find_by_path(path)
    $stdout.puts "Updated: #{song.path}"
  end
end
