# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all

test = User.create!(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')

testnote = Note.create!(body: 'hello world')
testlink = Link.create!(url: 'google.com')

test.notes << testnote
test.links << testlink
