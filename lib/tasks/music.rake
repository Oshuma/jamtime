namespace :jamtime do
  desc 'Update music database'
  task :update => [ :environment ] do
    JamTime.update_database
  end
end
