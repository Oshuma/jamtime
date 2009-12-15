Factory.define(:song) do |s|
  s.sequence(:title)  { |i| "Title #{i}"  }
  s.sequence(:artist) { |i| "Artist #{i}" }
  s.sequence(:album)  { |i| "Album #{i}"  }
  s.sequence(:genre)  { |i| "Genre #{i}"  }
  s.sequence(:path)   { |i| create_song("test#{i}.mp3") }
end
