# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.transaction do
  
  ArtworkShare.delete_all
  Artwork.delete_all
  User.delete_all

  jerry = User.create!(
      username: "jerry"
    )

  susan = User.create!(
      username: "susan"
    )

  karen = User.create!(
      username: "karen"
    )

  jackson = User.create!(
      username: "jackson"
    )

  the_dance = Artwork.create!(
      title: "The Dance",
      image_url: 'http://www.matisse.com/the_dance.jpeg',
      artist_id: susan.id
      )
  blue_poles = Artwork.create!(
      title: "Blue Poles",
      image_url: 'http://www.pollock.com/blue_poles.jpeg',
      artist_id: jerry.id
      )
  waterlillies = Artwork.create!(
      title: "Waterlillies",
      image_url: 'http://www.monet.com/waterlillies.jpeg',
      artist_id: jackson.id
      )
  blumps = Artwork.create!(
      title: "Blumps",
      image_url: 'http://www.otterness.com/blumps.jpeg',
      artist_id: karen.id
      )
    
  share1 = ArtworkShare.create!(
    artwork_id: blue_poles.id,
    viewer_id: karen.id
  )
  share2 = ArtworkShare.create!(
    artwork_id: blumps.id,
    viewer_id: jerry.id
  )

  comment1 = Comment.create!(
    author_id: 3,
    artwork_id: 1,
    body: "Man, I could paint better than him"
  )
end