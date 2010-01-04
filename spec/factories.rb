Factory.define(:artist) do |a|
  a.sequence(:name) { |i| "Artist #{i}" }
end

Factory.define(:album) do |a|
  a.artist { |album| album.association(:artist) }
  a.sequence(:name) { |i| "Album #{i}" }
end

Factory.define(:song) do |s|
  s.sequence(:title)  { |i| "Title #{i}"  }
  s.sequence(:artist) { |i| "Artist #{i}" }
  s.sequence(:album)  { |i| "Album #{i}"  }
  s.sequence(:genre)  { |i| "Genre #{i}"  }
  s.sequence(:path)   { |i| create_song("test#{i}.mp3") }
end
