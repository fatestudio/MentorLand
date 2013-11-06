# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role 'admin'
user.add_role 'user'
user.add_role 'mentor'
user.add_role 'student'

user2 = User.find_or_create_by_email :name => 'pureadmin', :email => 'pureadmin@example.com', :password => 'pureadmin', :password_confirmation => 'pureadmin'
puts 'user: ' << user2.name
user2.add_role 'admin'
user2.add_role 'user'

user3 = User.find_or_create_by_email :name => 'pureamentor', :email => 'purementor@example.com', :password => 'purementor', :password_confirmation => 'purementor'
puts 'user: ' << user3.name
user3.add_role 'mentor'
user3.add_role 'user'

user4 = User.find_or_create_by_email :name => 'purestudent', :email => 'purestudent@example.com', :password => 'purestudent', :password_confirmation => 'purestudent'
puts 'user: ' << user4.name
user4.add_role 'student'
user4.add_role 'user'

user5 = User.find_or_create_by_email :name => 'mentorstudent', :email => 'mentorstudent@example.com', :password => 'mentorstudent', :password_confirmation => 'mentorstudent'
puts 'user: ' << user5.name
user5.add_role 'mentor'
user5.add_role 'student'
user5.add_role 'user'

user6 = User.find_or_create_by_email :name => 'pureuser', :email => 'pureuser@example.com', :password => 'pureuser', :password_confirmation => 'pureuser'
puts 'user: ' << user6.name
user6.add_role 'user'

 
