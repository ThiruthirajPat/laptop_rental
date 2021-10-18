puts "Cleaning database..."
User.destroy_all
Laptop.destroy_all
Review.destroy_all

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

user7 = {
          first_name: "Frederic",
          last_name: "Dupuche",
          email: "fred.dupuche@gmail.com",
          password: "secret"
        }

user8 = {
          first_name: "Cedric",
          last_name: "Thonney",
          email: "c.thonney@gmail.com",
          password: "secret"
        }

user9 = {
          first_name: "Remis",
          last_name: "Dumas",
          email: "r.dumas@gmail.com",
          password: "secret"
        }

[user1, user2, user3, user4, user5, user6, user7, user8, user9].each do |attributes|
  user = User.create!(attributes)
    puts "Created #{user.first_name} #{user.last_name}"
end

puts "Creating laptops..."

laptop1 = {
            brand: "HP",
            model: "Pavilion 15",
            operating_system: "Windows",
            date_manufacture: Date.new(2021, 1, 4),
            collection_point: "Curepipe, Mauritius",
            rental_rate: "100",
            user: User.first
}

laptop2 = {
            brand: "Apple",
            model: "Macbook Pro",
            operating_system: "Mac",
            date_manufacture: Date.new(2021, 2, 3),
            collection_point: "Port Louis, Mauritius",
            rental_rate: "150",
            user: User.second
}

laptop3 = {
            brand: "Dell",
            model: "Latitude 9520",
            operating_system: "Linux",
            date_manufacture: Date.new(2021, 3, 5),
            collection_point: "Quatre Bornes, Mauritius",
            rental_rate: "70",
            user: User.third
}

laptop4 = {
            brand: "Asus",
            model: "Vivobook 15 OLED0",
            operating_system: "Windows",
            date_manufacture: Date.new(2021, 1, 6),
            collection_point: "Curepipe, Mauritius",
            rental_rate: "100",
            user: User.first
          }

laptop5 = {
            brand: "Acer",
            model: "Aspire 5",
            operating_system: "Windows",
            date_manufacture: Date.new(2021, 6, 8),
            collection_point: "Port Louis, Mauritius",
            rental_rate: "150",
            user: User.second
          }

laptop6 = {
            brand: "Lenovo",
            model: "ThinkPad T470",
            operating_system: "Linux",
            date_manufacture: Date.new(2021, 5, 10),
            collection_point: "Quatre Bornes, Mauritius",
            rental_rate: "70",
            user: User.third
          }

[laptop1, laptop2, laptop3, laptop4, laptop5, laptop6].each do |attributes|
  laptop = Laptop.create!(attributes)
  puts "Created #{laptop.brand}"
end

puts "Creating Bookings"

booking1 = {
           laptop: Laptop.find(1),
           user: User.find(4),
           date_from: Date.new(2021,11,1),
           date_to: Date.new(2021,11,6)
}

booking2 = {
            laptop: Laptop.find(1),
            user: User.find(5),
            date_from: Date.new(2021,12,1),
            date_to: Date.new(2021,12,6)
}

booking3 = {
            laptop: Laptop.find(2),
            user: User.find(6),
            date_from: Date.new(2021,12,11),
            date_to: Date.new(2021,12,16)
}

booking4 = {
            laptop: Laptop.find(2),
            user: User.find(7),
            date_from: Date.new(2021,12,1),
            date_to: Date.new(2021,12,6)
}
  
booking5 = {
            laptop: Laptop.find(3),
            user: User.find(8),
            date_from: Date.new(2021,12,11),
            date_to: Date.new(2021,12,16)
}

booking6 = {
            laptop: Laptop.find(3),
            user: User.find(9),
            date_from: Date.new(2021,12,11),
            date_to: Date.new(2021,12,16)
}

[booking1, booking2, booking3, booking4, booking5, booking6].each do |attributes|
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
  content: "Average Laptop. Owner is reliable though."
}

review3 = {
  booking: Booking.find(3),        
  rating: 5,
  content: "Great Laptop. Not returning it."
}

review4 = {
  booking: Booking.find(4),        
  rating: 5,
  content: "Wow! What a Laptop.Still dreaming of it"
}

review5 = {
  booking: Booking.find(5),        
  rating: 4,
  content: "Recommend for gaming."
}

review6 = {
  booking: Booking.find(6),        
  rating: 4,
  content: "What are you waiting to book this laptop?"
}

[review1, review2, review3, review4, review5, review6].each do |attributes|
  review = Review.create!(attributes)
  puts "Created #{review.id} by #{review.booking.user.last_name}"
  end

puts "Finished!"
