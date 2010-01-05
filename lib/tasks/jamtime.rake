namespace :jamtime do

  namespace :music do
    desc 'Update music database'
    task :update => [ :environment ] do
      JamTime::Music.update
    end
  end

end
