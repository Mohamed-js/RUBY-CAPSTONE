#!/usr/bin/env ruby
require 'csv'
require_relative '../lib/scraper_class'
# Starting Scrapper!
# Initialize the instance
scraper = Scraper.new

# 1-enter Link of page
puts '1- Enter the product page link to be scraped :'
link = gets.chomp

puts '2- Enter the category name :'
category = gets.chomp

puts '3- Enter the category_id :'
category_id = gets.chomp


me = scraper.query(link)
drugs = scraper.img_in_src(me, 'ًBaby Care', category, category_id)




# Write the results

CSV.open("cosmo.csv", "w") do |csv|
    drugs.each do |drug|
        csv << [drug[:name], drug[:image_data], drug[:category], drug[:sub_category], drug[:cosm_cat_id]]
    end
end
