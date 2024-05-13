# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(first_name: "Hamza", last_name: "Malik", email: "hamzamalik22258@gmail.com", password: "123456", role: 2)
Constituency.create!(name: 'NA-1')
Constituency.create!(name: 'NA-2')
Constituency.create!(name: 'NA-3')
Constituency.create!(name: 'NA-4')
Constituency.create!(name: 'NA-5')
Constituency.create!(name: 'NA-6')
Constituency.create!(name: 'NA-7')
Constituency.create!(name: 'NA-8')
Constituency.create!(name: 'NA-9')
# c = User.new(first_name: "hamza", last_name: "malik", email: "hamzamalik@gmail.com", password: "123456", role: 2,
#              constituency_id: 1)

# c.save

# CandidateProfile.create!(party: "PPP", user_id: 2)

User.create!(first_name: 'Hamza', last_name: 'Malik', email: 'hamzamalik@gmail.com', password: '123456', role: 2,
             constituency_id: 1, cnic: '1234567890121')
User.create!(first_name: 'Umar', last_name: 'Ali', email: 'umarali@gmail.com', password: '123456', role: 0,
             constituency_id: 1, cnic: '1234567890122')
User.create!(first_name: 'Ahsan', last_name: 'Zaheer', email: 'ahsanzaheer@gmail.com', password: '123456', role: 0,
             constituency_id: 1, cnic: '1234567890123')
User.create!(first_name: 'Ali', last_name: 'Hassan', email: 'alihassan@gmail.com', password: '123456', role: 0,
             constituency_id: 1, cnic: '1234567890124')
User.create!(first_name: 'Wahab', last_name: 'Khan', email: 'wahabkhan@gmail.com', password: '123456', role: 0,
             constituency_id: 1, cnic: '1234567890125')
User.create!(first_name: 'Hamza', last_name: 'Khan', email: 'hamzakhan@gmail.com', password: '123456', role: 0,
             constituency_id: 1, cnic: '1234567890126')
User.create!(first_name: 'Akbar', last_name: 'Khan', email: 'akbarkhan@gmail.com', password: '123456', role: 0,
             constituency_id: 2, cnic: '1234567890127')
User.create!(first_name: 'Usman', last_name: 'Sheikh', email: 'usmansheikh@gmail.com', password: '123456', role: 0,
             constituency_id: 2, cnic: '1234567890128')
User.create!(first_name: 'Hasnat', last_name: 'Khan', email: 'hasnatkhan@gmail.com', password: '123456', role: 0,
             constituency_id: 2, cnic: '1234567890129')
User.create!(first_name: 'Ali', last_name: 'Malik', email: 'alimalik@gmail.com', password: '123456', role: 0,
             constituency_id: 2, cnic: '1234567890120')

# Vote.create!(candidate_id: 2, user_id: 8, election_id: 2, constituency_id: 1, cast_time: DateTime.current)

# puts Vote.find(1).user.inspect
# puts User.find_by_first_name("Hamza").candidate_profile.inspect
# c = User.find(3)
# puts Vote.where(candidate_id: c.id).count

# c = Constituency.find(1).votes.where(election_id: 9).group_by(&:candidate_id)
# candidate_id = 0
# max_votes = -1
# c.each do |candidate, vote|
#   if vote.count > max_votes
#     candidate_id = candidate
#     max_votes = vote.count
#   end
# end
# puts candidate_id
# var = Array.new(10)
# (1..10).each do |i|
#   var[i] = -1
# end
# Rails.logger.debug var.inspect
