#!/usr/bin/env ruby

require_relative '../lib/scraper_class'
# Starting Scrapper!
# Initialize the instance
scraper = Scraper.new

# 1-enter Link of page
puts '1- Enter the product page link to be scraped :'
puts ''
link = gets.chomp

puts '2- Enter the category name :'
puts ''
category = gets.chomp

puts '3- Enter the category_id :'
puts ''
category_id = gets.chomp

# 2- Set the method
me = scraper.query(link)

goods = scraper.img_in_src(me, 'ًBaby Care', category, category_id)

p goods
