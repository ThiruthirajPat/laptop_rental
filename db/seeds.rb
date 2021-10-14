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

[user1, user2, user3].each do |attributes|
  user = User.create!(attributes)
    puts "Created #{user.first_name} #{user.last_name}"
end

puts "Creating laptops..."

laptop1 = {
            brand: "HP",
            model: "HP1370",
            operating_system: "Windows",
            date_manufacture: Date.new(2020, 1, 7),
            collection_point: "Curepipe",
            rental_rate: "100",
            user: User.first
          }

laptop2 = {
            brand: "Apple",
            model: "Macbook Pro",
            operating_system: "Mac",
            date_manufacture: Date.new(2020, 2, 7),
            collection_point: "Port Louis",
            rental_rate: "150",
            user: User.second
          }

laptop3 = {
            brand: "Dell",
            model: "Latitude",
            operating_system: "Linux",
            date_manufacture: Date.new(2020, 3, 7),
            collection_point: "Quatre Bornes",
            rental_rate: "70",
            user: User.third
          }

[laptop1, laptop2, laptop3].each do |attributes|
  laptop = Laptop.create!(attributes)
  puts "Created #{laptop.brand}"
end

puts "Finished!"
