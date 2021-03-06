Song.destroy_all
Photo.destroy_all
Artist.destroy_all

#Create artists
artist1 = Artist.create!({ name: "Nora", date_of_birth: Date.new(1977,10,22), nationality: "Malaysian"})
artist2 = Artist.create!({ name: "Matthijs", date_of_birth: Date.new(1986,8,19), nationality: "Dutch"})
artist3 = Artist.create!({ name: "Trang", date_of_birth: Date.new(1980,7,17), nationality: "Vietnamese"})
artist4 = Artist.create!({ name: "Ximena", date_of_birth: Date.new(1983,7,15), nationality: "Columbian"})

#Create songs
song1 = Song.create!({ name: "Shine, Jesus, Shine", category: "Gospel/Christian music", composer: "Harriet", artist: artist1})
song2 = Song.create!({ name: "Hello", category: "Pop", composer: "Ha", artist: artist1})
song3 = Song.create!({ name: "I saw the light", category: "Blues", composer: "Harriet", artist: artist2})
song4 = Song.create!({ name: "Only you", category: "Rock", composer: "Glory", artist: artist2})
song5 = Song.create!({ name: "Blessed be your name", category: "Gospel/Christian music", composer: "Johan", artist: artist3})
song6 = Song.create!({ name: "Happy new year", category: "Pop", composer: "Abba", artist: artist3})
song7 = Song.create!({ name: "Color of the wind", category: "Pop", composer: "David", artist: artist4})
song8 = Song.create!({ name: "The Gospel train is coming", category: "Gospel/Christian music", composer: "Peter", artist: artist4})

#Photo
photo1 = Photo.create!(artist: artist1, remote_image_url: "http://res.cloudinary.com/hacloudinary/image/upload/v1510484222/tulip1_d9vcdn.jpg")
photo2 = Photo.create!(artist: artist2, remote_image_url: "http://res.cloudinary.com/hacloudinary/image/upload/v1510484379/tulip2_fny7d1.jpg")
photo3 = Photo.create!(artist: artist3, remote_image_url: "http://res.cloudinary.com/hacloudinary/image/upload/v1510484136/tulip3_km0ouf.jpg")
photo4 = Photo.create!(artist: artist4, remote_image_url: "http://res.cloudinary.com/hacloudinary/image/upload/v1510484390/tulip4_neddde.jpg")
