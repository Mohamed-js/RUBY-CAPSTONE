#!/usr/bin/env ruby

require_relative '../lib/scraper_class'
# Starting Scrapper!
# Initialize the instance
scraper = Scraper.new

# WELCOME ::
puts '******************************************'
puts ''
puts 'Welcome to scruby ruby doooooooooooooooooo ^_^'
puts ''
puts '******************************************'
puts ''
puts '**Please follow the following instructions:**'
puts ''
puts '******************************************'

# 1-enter Link of page
puts '1- Enter the product page link to be scraped :'
puts ''
puts 'hint, You can use this demo link:'
puts '"Just copy and paste it and press enter"'

link = gets.chomp

# 2- Set the method
me = scraper.query("")

goods = scraper.img_in_src(me)

p goods


