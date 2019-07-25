# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Traveler.create(firstname: "Ashley", lastname: "Westcott", birthday: "01/05/1990", email: "ashley.e.westcott@gmail.com", photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI7zBYwL2UK_mfrs3Y-oUrmll5lfpoHZX0ktl-fPJCxhBcBCvx", username: "test", password: "test")
Traveler.create(firstname: "Jill", lastname: "Westcott", birthday: "04/12/1996", email: "jill.westcott@gmail.com", photo: "https://banner2.kisspng.com/20180317/hse/kisspng-computer-icons-user-clip-art-computer-user-clipart-5aad15e8425433.2847546715212927762717.jpg", username: "test1", password: "test1")

Trip.create(trip_name: "New Zealand & Australia", start_date: "2019-06-17 21:02:34", end_date: "2019-06-19 21:02:34", traveler_id: 1)
Trip.create(trip_name: "Argentina & Brazil", start_date: "2019-06-17 21:02:34", end_date: "2019-06-19 21:02:34", traveler_id: 2)
Trip.create(trip_name: "Canada & United States", start_date: "2019-06-20 21:02:34", end_date: "2019-06-24 21:02:34", traveler_id: 1)

Detail.create(google_maps_info: "New Zealand", category: "location", notes: "TBD", start_date: "2019-06-17 21:02:34", end_date: "2019-06-18 21:02:34", trip_id: 1)
Detail.create(google_maps_info: "Australia", category: "location", notes: "TBD", start_date: "2019-06-18 21:02:34", end_date: "2019-06-19 21:02:34", trip_id: 1)

Detail.create(google_maps_info: "Argentina", category: "location", notes: "TBD", start_date: "2019-06-17 21:02:34", end_date: "2019-06-18 21:02:34", trip_id: 2)
Detail.create(google_maps_info: "Brazil", category: "location", notes: "TBD", start_date: "2019-06-18 21:02:34", end_date: "2019-06-19 21:02:34", trip_id: 2)

Detail.create(google_maps_info: "Canada", category: "location", notes: "TBD", start_date: "2019-06-20 21:02:34", end_date: "2019-06-22 21:02:34", trip_id: 3)
Detail.create(google_maps_info: "United States", category: "location", notes: "TBD", start_date: "2019-06-23 21:02:34", end_date: "2019-06-24 21:02:34", trip_id: 3)
