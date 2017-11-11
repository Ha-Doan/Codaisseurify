Song.destroy_all
Artist.destroy_all

#Create artists
artist1 = Artist.create!({ name: "Nora", date_of_birth: Date.new(1977,10,22), nationality: "Malaysian"})
artist2 = Artist.create!({ name: "Matthijs", date_of_birth: Date.new(1986,8,19), nationality: "Dutch"})
artist3 = Artist.create!({ name: "Trang", date_of_birth: Date.new(1980,7,17), nationality: "Vietnamese"})
artist4 = Artist.create!({ name: "Ximena", date_of_birth: Date.new(1983,7,15), nationality: "Columbian"})

#Create songs
song1 = Song.create!({ name: "Shine, Jesus, Shine", category: "Gospel/Christian music", composer: "Harriet", artist_id: 1})
song2 = Song.create!({ name: "Hello", category: "Pop", composer: "Ha", artist_id: 1})
song3 = Song.create!({ name: "I saw the light", category: "Blues", composer: "Harriet", artist_id: 2})
song4 = Song.create!({ name: "Only you", category: "Rock", composer: "Glory", artist_id: 2})
song5 = Song.create!({ name: "Blessed be your name", category: "Gospel/Christian music", composer: "Johan", artist_id: 3})
song6 = Song.create!({ name: "Happy new year", category: "Pop", composer: "Abba", artist_id: 3})
song7 = Song.create!({ name: "Color of the wind", category: "Pop", composer: "David", artist_id: 4})
song8 = Song.create!({ name: "The Gospel train is coming", category: "Gospel/Christian music", composer: "Peter", artist_id: 4})
