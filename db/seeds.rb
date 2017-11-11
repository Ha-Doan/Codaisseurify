Song.destroy_all
Artist.destroy_all

#Create artists
artist1 = Artist.create!({ name: "Nora", date_of_birth: Date.new(1977,10,22), nationality: "Malaysian"})
artist2 = Artist.create!({ name: "Matthijs", date_of_birth: Date.new(1986,8,19), nationality: "Dutch"})

#Create songs
song1 = Song.create!({ name: "Shine, Jesus, Shine", category: "Gospel/Christian music", composer: "Harriet", artist_id: 1})
song2 = Song.create!({ name: "Hello", category: "Pop", composer: "Ha", artist_id: 1})
song3 = Song.create!({ name: "I saw the light", category: "Blues", composer: "Harriet", artist_id: 2})
song2 = Song.create!({ name: "Only you", category: "Rock", composer: "Glory", artist_id: 2})
