# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


 admin_user1 = User.new( :email => 'nageeb94@hotmail.com', :password => '12345678')
 admin_user1.admin = true
 admin_user1.approved = true
 admin_user1.save!

 user = User.new( :email => 'jirobeno@hotmail.com', :password => '12345678')
 user.is_Ideator = true
 user.approved = true
 user.save!

user = User.new( :email => 'jirobeno1@hotmail.com', :password => '12345678')
user.is_Volunteer = true
user.approved = true
user.save!

ideator_user1 = User.new( :email => 'mariam3fifi@hotmail.com', :password => '12345678')
ideator_user1.is_Idea_Consultant = true
ideator_user1.approved = true
ideator_user1.save!

