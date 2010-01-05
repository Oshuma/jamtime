Factory.define(:artist) do |a|
  a.sequence(:name) { |i| "Artist #{i}" }
end

Factory.define(:album) do |a|
  a.artist { |album| album.association(:artist) }
  a.sequence(:name) { |i| "Album #{i}" }
end

Factory.define(:song) do |s|
  s.artist { |song| song.association(:artist) }
  s.album  { |song| song.association(:album)  }
  s.sequence(:title) { |i| "Song #{i}" }
  s.sequence(:path)   { |i| create_song("test#{i}.mp3") }
end

Factory.define(:user) do |u|
  u.sequence(:login) { |i| "luser#{i}" }
  u.email { |user| "#{user.login}@example.com" }
  u.password 'sekretz'
  u.password_confirmation { |user| user.password }
end
