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
puts "1- Enter the E-commerce page link 'url' to be scraped:"
link = gets.chomp


# 2-enter SELECTOR of the name of product
puts 'Enter the Direct SELECTOR of the name of the product:'
name = gets.chomp


# 3-enter  SELECTOR of the <a> link of product
puts "Enter the Direct SELECTOR of the anchor tag <a> 'product page link':"
product_page = gets.chomp


# 4-enter  SELECTOR of the img of product
puts 'Enter the Direct SELECTOR of the <img> element:'
img = gets.chomp


# 5-enter  SELECTOR of the price of product
puts 'Enter the page Direct SELECTOR of the price containing element:'
price = gets.chomp


# 6- ASK about img src to set method
end_loop = false
while end_loop == false
  puts "If the Image source is in the attr 'src' then Enter 1"
  puts "If the Image source is in the attr 'data-src', please Enter 2"
  puts "If the Image source is in a different attr 'data-src', please Enter 3"
  reply = gets.chomp
  end_loop = true if %w[1 2 3].include?(reply)
end


# 7- Set the method
me = scraper.query(link)
goods = scraper.img_in_src(me, name, product_page, img, price) if reply == '1'
goods = scraper.img_in_data_src(me, name, product_page, img, price) if reply == '2'
if reply == "3"
    puts "Enter the attr name:"
    the_other_attr = gets.chomp
    goods = scraper.img_in_another_attr(me, name, product_page, img, price, the_other_attr)
end


# 8- Display Items
display_goods(goods)
