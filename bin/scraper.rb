#!/usr/bin/env ruby

require_relative '../lib/scraper_class.rb'
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
puts "1- Enter the Souq product page link to be scraped :"
link = gets.chomp
# https://deals.souq.com/eg-en/smart-tvs/c/15236



# 2- Set the method
me = scraper.query(link)
name = 'h6.title a'
product_page = 'h6.title a'
img = 'a.img-link img'
price = 'h5.price span.is'
goods = scraper.img_in_data_src(me, name, product_page, img, price)


# 3- Display Items
display_goods(goods)
