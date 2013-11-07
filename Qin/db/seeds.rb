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

pureadmin = User.find_or_create_by_email :name => 'pureadmin', :email => 'pureadmin@example.com', :password => 'pureadmin', :password_confirmation => 'pureadmin'
puts 'user: ' << pureadmin.name
pureadmin.add_role 'admin'
pureadmin.add_role 'user'

purementor = User.find_or_create_by_email :name => 'purementor', :email => 'purementor@example.com', :password => 'purementor', :password_confirmation => 'purementor'
puts 'user: ' << purementor.name
purementor.add_role 'mentor'
purementor.add_role 'user'


purestudent = User.find_or_create_by_email :name => 'purestudent', :email => 'purestudent@example.com', :password => 'purestudent', :password_confirmation => 'purestudent'
puts 'user: ' << purestudent.name
purestudent.add_role 'student'
purestudent.add_role 'user'

# still have some questions: how to let user... it seems that one model, single table inheritance is the best...
mentorstudent = User.find_or_create_by_email :name => 'mentorstudent', :email => 'mentorstudent@example.com', :password => 'mentorstudent', :password_confirmation => 'mentorstudent'
puts 'user: ' << mentorstudent.name
mentorstudent.add_role 'mentor'
mentorstudent.add_role 'student'
mentorstudent.add_role 'user'

pureuser = User.find_or_create_by_email :name => 'pureuser', :email => 'pureuser@example.com', :password => 'pureuser', :password_confirmation => 'pureuser'
puts 'user: ' << pureuser.name
pureuser.add_role 'user'


course1 = Course.find_or_create_by_name(:user_id => purementor.id, :name => 'CS290B', :price => 10, :capacity => 10)
puts 'course: ' << course1.name
course2 = Course.find_or_create_by_name(:user_id => purementor.id, :name => 'CS290CC', :price => 10, :capacity => 10)
puts 'course: ' << course2.name
course3 = Course.find_or_create_by_name(:user_id => mentorstudent.id, :name => 'CS40', :price => 20, :capacity => 10)
puts 'course: ' << course3.name


enrollment1 = Enrollment.create(:user_id => purestudent.id, :course_id => course1.id)
puts 'enrollment: '
enrollment2 = Enrollment.create(:user_id => purestudent.id, :course_id => course2.id)
puts 'enrollment: '


