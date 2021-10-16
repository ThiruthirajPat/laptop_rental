puts "Cleaning database..."
User.destroy_all
Laptop.destroy_all

puts "Creating users..."

user1 = {
          first_name: "Shyam",
          last_name: "Abacousnac",
          email: "shyam.abacousnac@gmail.com",
          password: "secret"
        }

user2 = {
          first_name: "Vickram",
          last_name: "Bayragee",
          email: "laptop.test@gmail.com",
          password: "secret"
        }

user3 = {
          first_name: "Kaviraj",
          last_name: "Pather",
          email: "pather.thiruthiraj@gmail.com",
          password: "secret"
        }

user4 = {
          first_name: "Nikhil",
          last_name: "Anauth",
          email: "nikhil.anauth@gmail.com",
          password: "secret"
        }

user5 = {
          first_name: "Nicolas",
          last_name: "Bagnath",
          email: "nicolas.bagnath@gmail.com",
          password: "secret"
        }

user6 = {
          first_name: "Radhika",
          last_name: "Sookeera",
          email: "radhika.sookeera@gmail.com",
          password: "secret"
        }

[user1, user2, user3, user4, user5, user6].each do |attributes|
  user = User.create!(attributes)
    puts "Created #{user.first_name} #{user.last_name}"
end

puts "Creating laptops..."

laptop1 = {
            brand: "HP",
            model: "HP1370",
            operating_system: "Windows",
            date_manufacture: Date.new(2020, 1, 7),
            collection_point: "Curepipe, Mauritius",
            rental_rate: "100",
            user: User.first
          }

laptop2 = {
            brand: "Apple",
            model: "Macbook Pro",
            operating_system: "Mac",
            date_manufacture: Date.new(2020, 2, 7),
            collection_point: "Port Louis, Mauritius",
            rental_rate: "150",
            user: User.second
          }

laptop3 = {
            brand: "Dell",
            model: "Latitude",
            operating_system: "Linux",
            date_manufacture: Date.new(2020, 3, 7),
            collection_point: "Quatre Bornes, Mauritius",
            rental_rate: "70",
            user: User.third
          }

[laptop1, laptop2, laptop3].each do |attributes|
  laptop = Laptop.create!(attributes)
  puts "Created #{laptop.brand}"
end

puts "Creating Bookings"

booking1 = {
           laptop: Laptop.find(1),
           user: User.find(4),
           date_from: Date.new(2021,11,1),
           date_to: Date.new(2021,11,6),
           status: "In Progress"
           }

booking2 = {
            laptop: Laptop.find(2),
            user: User.find(5),
            date_from: Date.new(2021,12,1),
            date_to: Date.new(2021,12,6),
            status: "In Progress"
            }

booking3 = {
            laptop: Laptop.find(3),
            user: User.find(6),
            date_from: Date.new(2021,12,11),
            date_to: Date.new(2021,12,16),
            status: "In Progress"
            }

[booking1, booking2, booking3].each do |attributes|
  booking = Booking.create!(attributes)
  puts "Created booking by #{booking.user.last_name}"
  end

puts "Creating Reviews"

review1 = {
          booking: Booking.find(1),        
          rating: 1,
          content: "Poor Service. Laptop not working",
          
}


review2 = {
  booking: Booking.find(2),        
  rating: 3,
  content: "Average Laptop. Owner is reliable."
}


review3 = {
  booking: Booking.find(3),        
  rating: 5,
  content: "Great Laptop. Not returning it."
}

[review1, review2, review3].each do |attributes|
  review = Review.create!(attributes)
  puts "Created #{review.id} by #{review.booking.user.last_name}"
  end

puts "Finished!"
