puts "Cleaning database..."
Laptop.destroy_all

puts "Creating laptops..."

laptop1 = {
            brand: "HP",
            model: "HP1370",
            operating_system: "Windows",
            date_manufacture: Date.new(2020, 1, 7),
            collection_point: "Curepipe",
            rental_rate: "100",
            user: User.create!({ email: "laptop1@hp.com" })
          }

laptop2 = {
            brand: "Apple",
            model: "Macbook Pro",
            operating_system: "Mac",
            date_manufacture: Date.new(2020, 2, 7),
            collection_point: "Port Louis",
            rental_rate: "150",
            user: User.create!({ email: "laptop2@mac.com" })
          }

laptop3 = {
            brand: "Dell",
            model: "Latitude",
            operating_system: "Linux",
            date_manufacture: Date.new(2020, 3, 7),
            collection_point: "Quatre Bornes",
            rental_rate: "70",
            user: User.create!({ email: "laptop3@linux.com" })
          }

[laptop1, laptop2, laptop3].each do |attributes|
  laptop = Laptop.create!(attributes)
  puts "Created #{laptop.brand}"
end

puts "Finished!"
