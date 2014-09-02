# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do |i|
  Art.create(title: "Test Art Asset ##{i}", description: "Test Art Asset ##{i}", medium: "oil on canvas", category_cd: i%3, year: 2014, width:20, height:20, filename: "foo.jpg")
end