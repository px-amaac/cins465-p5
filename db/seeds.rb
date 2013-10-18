# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ZipCode.delete_all
zipFilename = Rails.root.join('app', 'assets', 'zips.txt')
zipcodes = open(zipFilename.to_s) do |zipcodes| 
	zipcodes.read.each_line do |zipcode|
		zip = zipcode.gsub("\n").to_i
		ZipCode.create!(:zip => zip)
		puts zip
	end
end

Color.delete_all
colorFilename = Rails.root.join('app', 'assets', 'colors.txt')
colors = open(colorFilename.to_s) do |colors|
	colors.read.each_line do |color|
		name, hex = color.chomp.split(";")
		Color.create!(:name => name, :hex => hex)
		puts name
		puts hex
	end
end

