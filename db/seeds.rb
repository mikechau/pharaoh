# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Creating... Admin"

puts "Enter email:"
email = STDIN.gets.chomp

puts "Enter password:"
password = STDIN.gets.chomp

admin = User.new({
              name: "Admin Admin",
              email: email,
              password: password,
              password_confirmation: password,
              confirmed_at: Time.now
            })

admin.add_role :admin
admin.skip_confirmation!
admin.save!

puts "Remember to change your admin password!"