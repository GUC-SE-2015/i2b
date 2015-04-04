# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new( :email => 'hisen94@hotmail.com', :password => '12345678')
user.approved = true
user.save!


admin_user1 = User.new( :email => 'nageeb94@hotmail.com', :password => '12345678')
admin_user1.admin = true
admin_user1.approved = true
admin_user1.save!